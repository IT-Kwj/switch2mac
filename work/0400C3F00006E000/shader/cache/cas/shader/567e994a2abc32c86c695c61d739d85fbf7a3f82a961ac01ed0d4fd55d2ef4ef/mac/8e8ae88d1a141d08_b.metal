#pragma clang diagnostic ignored "-Wmissing-prototypes"

#include <metal_stdlib>
#include <simd/simd.h>

using namespace metal;

struct dm_border_t { uint mask; float4 k[32]; };
static inline __attribute__((always_inline)) float4 dm_bmix(float4 r, float4 w, float4 k) { return r + (w - r) * k; }
static inline __attribute__((always_inline)) float dm_bmix(float r, float w, float4 k) { return r + (w - r) * k.x; }
template<typename V, typename T, typename... A> static inline __attribute__((always_inline)) V dm_bs(V r, constant dm_border_t* b, uint i, T t, sampler w, A... a)
{
    if (b->mask >> i & 1u) r = dm_bmix(r, t.sample(w, a...), b->k[i]);
    return r;
}

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_CSmplr_w [[id(9)]];
    sampler fp_t_tcb_ASmplr_w [[id(10)]];
    constant dm_border_t* dm_border [[id(11)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_35 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _1011, thread const int& _1012, constant _10& support_buffer)
{
    int _1015 = 1 + _1012;
    float _1017 = support_buffer._m5[_1015].x;
    float _1019 = abs(_1017);
    bool _1021 = _1019 == 1.0;
    if (_1021)
    {
        return _1011;
    }
    float _1023 = float(_1011);
    float _1025 = _1023 / _1019;
    int _1027 = int(_1025);
    return _1027;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _48 = gl_FragCoord.w;
    float _50 = in.m_33.x;
    float _52 = gl_FragCoord.w;
    float _54 = _50 * _52;
    float _56 = in.m_33.y;
    float _58 = gl_FragCoord.w;
    float _60 = _56 * _58;
    float _62 = 1.0 / _48;
    float _64 = _62 * _54;
    float _66 = _62 * _60;
    float2 _466 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_466, float2(0.0), isnan(_466))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_466, float2(0.0), isnan(_466))).x;
    float2 _477 = float2(_64, _66);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_477, float2(0.0), isnan(_477))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_477, float2(0.0), isnan(_477))).x;
    float _72 = in.m_35.z;
    float _74 = gl_FragCoord.w;
    float _76 = _72 * _74;
    float _78 = in.m_35.x;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_35.y;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = _62 * _76;
    float _92 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_70, _94);
    float _102 = precise::max(_100, _90);
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = _62 * _82;
    float _122 = _62 * _88;
    float _124 = precise::min(_98, _118);
    bool _126 = !_114;
    if (!_126)
    {
        float _128 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _130 = fma(_102, _128, 1.0);
        float _132 = log2(_130);
        float _134 = _132 + (-1.0);
        float _136 = trunc(_134);
        int _138 = int(_136);
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).x;
        int _142 = _140;
        int _144 = 2;
        int _146 = _44(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _150 = _148;
        int _152 = 2;
        int _154 = _44(_150, _152, (*spvDescriptorSet0.support_buffer));
        float _156 = float(_146);
        float _158 = float(_154);
        float _160 = fma(_64, _156, -0.5);
        float _162 = fma(_66, _158, -0.5);
        float _164 = 1.0 / _156;
        float _166 = floor(_160);
        float _168 = floor(_162);
        float _170 = -_166;
        float _172 = _160 + _170;
        float _174 = -_172;
        float _176 = _174 + 1.0;
        float _178 = -_172;
        float _180 = _178 + 2.0;
        float _182 = -_168;
        float _184 = _162 + _182;
        float _186 = _176 * _176;
        float _188 = _180 * _180;
        float _190 = -_184;
        float _192 = _190 + 1.0;
        float _194 = _176 * _186;
        float _196 = -_184;
        float _198 = _196 + 2.0;
        float _200 = _192 * _192;
        float _202 = -_194;
        float _204 = _202 + 6.0;
        float _206 = _198 * _198;
        float _208 = _192 * _200;
        float _210 = _194 * 4.0;
        float _212 = _208 * 4.0;
        float _214 = -_210;
        float _216 = fma(_180, _188, _214);
        float _218 = -_208;
        float _220 = _218 + 6.0;
        float _222 = 1.0 / _158;
        float _224 = -_212;
        float _226 = fma(_198, _206, _224);
        float _228 = _194 + _216;
        float _230 = -_216;
        float _232 = _230 + _204;
        float _234 = _216 * 0.16666667163372039794921875;
        float _236 = _208 + _226;
        float _238 = -_226;
        float _240 = _238 + _220;
        float _242 = _228 * 0.16666667163372039794921875;
        float _244 = _232 * 0.16666667163372039794921875;
        float _246 = _236 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = 1.0 / _242;
        float _252 = _184 * _184;
        float _254 = _172 * _172;
        float _256 = _226 * 0.16666667163372039794921875;
        float _258 = _168 + 1.5;
        float _260 = _184 * _252;
        float _262 = _172 * _254;
        float _264 = _168 + (-0.5);
        float _266 = 1.0 / _246;
        float _268 = _166 + (-0.5);
        float _270 = _260 * 0.16666667163372039794921875;
        float _272 = _166 + 1.5;
        float _274 = _262 * 0.16666667163372039794921875;
        float _276 = 1.0 / _248;
        float _278 = fma(_234, _250, _268);
        float _280 = _278 * _164;
        float _282 = 1.0 / _244;
        float _284 = fma(_256, _266, _264);
        float _286 = fma(_270, _276, _258);
        float _288 = _284 * _222;
        float _290 = _286 * _222;
        float _292 = fma(_274, _282, _272);
        float _294 = _292 * _164;
        float2 _779 = float2(_280, _288);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_779, float2(0.0), isnan(_779)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_779, float2(0.0), isnan(_779)), level(_134)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _794 = float2(_294, _288);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_794, float2(0.0), isnan(_794)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_794, float2(0.0), isnan(_794)), level(_134)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _809 = float2(_280, _290);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_809, float2(0.0), isnan(_809)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_809, float2(0.0), isnan(_809)), level(_134)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _824 = float2(_294, _290);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_824, float2(0.0), isnan(_824)), level(_134)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_824, float2(0.0), isnan(_824)), level(_134)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = 0.0 + _132;
        float _332 = precise::clamp(_330, 0.0, 1.0);
        float _334 = fma(_122, _332, _120);
        float _336 = -_310;
        float _338 = _302 + _336;
        float _340 = -_308;
        float _342 = _300 + _340;
        float _344 = -_326;
        float _346 = _318 + _344;
        float _348 = -_324;
        float _350 = _316 + _348;
        float _352 = fma(_242, _338, _310);
        float _354 = fma(_242, _342, _308);
        float _356 = fma(_242, _346, _326);
        float _358 = -_312;
        float _360 = _304 + _358;
        float _362 = -_328;
        float _364 = _320 + _362;
        float _366 = fma(_242, _350, _324);
        float _368 = -_356;
        float _370 = _368 + _352;
        float _372 = fma(_242, _360, _312);
        float _374 = fma(_242, _364, _328);
        float _376 = -_366;
        float _378 = _376 + _354;
        float _380 = fma(_246, _370, _356);
        float _382 = _124 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _384 = -_374;
        float _386 = _384 + _372;
        float _388 = fma(_246, _378, _366);
        float _390 = _380 * 0.586600005626678466796875;
        float _392 = fma(_246, _386, _374);
        float _394 = fma(_388, 0.29890000820159912109375, _390);
        float _396 = fma(_392, 0.1143999993801116943359375, _394);
        float _398 = -_388;
        float _400 = _398 + _396;
        float _402 = -_380;
        float _404 = _402 + _396;
        float _406 = -_392;
        float _408 = _406 + _396;
        float _410 = fma(_382, _400, _388);
        float _412 = fma(_382, _404, _380);
        float _414 = fma(_382, _408, _392);
        float _416 = -_410;
        float _418 = fma(_410, (*spvDescriptorSet0.fp_c3)._m0[13].x, _416);
        float _420 = -_412;
        float _422 = fma(_412, (*spvDescriptorSet0.fp_c3)._m0[13].y, _420);
        float _424 = -_414;
        float _426 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[13].z, _424);
        float _428 = fma(_124, _418, _410);
        float _430 = fma(_124, _422, _412);
        float _432 = fma(_124, _426, _414);
        out.m_38.x = _428;
        out.m_38.y = _430;
        out.m_38.z = _432;
        out.m_38.w = _334;
        return out;
    }
    discard_fragment();
    return out;
}

