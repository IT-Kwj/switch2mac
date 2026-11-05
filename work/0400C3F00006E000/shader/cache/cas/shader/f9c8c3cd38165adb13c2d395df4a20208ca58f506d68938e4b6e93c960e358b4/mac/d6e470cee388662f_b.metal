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
    texture2d<float> fp_t_tcb_A [[id(4)]];
    sampler fp_t_tcb_ASmplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _1050, thread const int& _1051, constant _10& support_buffer)
{
    int _1054 = 1 + _1051;
    float _1056 = support_buffer._m5[_1054].x;
    float _1058 = abs(_1056);
    bool _1060 = _1058 == 1.0;
    if (_1060)
    {
        return _1050;
    }
    float _1062 = float(_1050);
    float _1064 = _1062 / _1058;
    int _1066 = int(_1064);
    return _1066;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _46 = gl_FragCoord.w;
    float _48 = in.m_31.x;
    float _50 = gl_FragCoord.w;
    float _52 = _48 * _50;
    float _54 = in.m_31.y;
    float _56 = gl_FragCoord.w;
    float _58 = _54 * _56;
    float _60 = 1.0 / _46;
    float _62 = _60 * _52;
    float _64 = _60 * _58;
    float2 _480 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_480, float2(0.0), isnan(_480))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_480, float2(0.0), isnan(_480))).x;
    float _68 = in.m_33.x;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = in.m_33.y;
    float _76 = gl_FragCoord.w;
    float _78 = _74 * _76;
    float _80 = in.m_33.z;
    float _82 = gl_FragCoord.w;
    float _84 = _80 * _82;
    float _86 = _60 * _72;
    float _88 = _60 * _78;
    float _90 = _60 * _84;
    float _92 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _94 = precise::clamp(_92, 0.0, 1.0);
    float _96 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = precise::max(_94, _98);
    float _102 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _104 = precise::clamp(_102, 0.0, 1.0);
    float _106 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _108 = precise::clamp(_106, 0.0, 1.0);
    float _110 = precise::max(_100, _90);
    bool _114 = _110 != 0.0;
    bool _116 = isnan(_110);
    bool _118 = _114 || _116;
    bool _120 = isnan(0.0);
    bool _122 = _118 || _120;
    float _124 = precise::min(_104, _108);
    bool _126 = !_122;
    if (!_126)
    {
        float _128 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _130 = fma(_110, _128, 1.0);
        float _132 = log2(_130);
        float _134 = _132 + (-1.0);
        float _136 = trunc(_134);
        int _138 = int(_136);
        int _140 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).x;
        int _142 = _140;
        int _144 = 1;
        int _146 = _42(_142, _144, (*spvDescriptorSet0.support_buffer));
        int _148 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_138), spvDescriptorSet0.fp_t_tcb_A.get_height(_138)).y;
        int _150 = _148;
        int _152 = 1;
        int _154 = _42(_150, _152, (*spvDescriptorSet0.support_buffer));
        float _156 = float(_146);
        float _158 = float(_154);
        float _160 = fma(_62, _156, -0.5);
        float _162 = fma(_64, _158, -0.5);
        float _164 = 1.0 / _156;
        float _166 = floor(_160);
        float _168 = floor(_162);
        float _170 = -_166;
        float _172 = _160 + _170;
        float _174 = 1.0 / _158;
        float _176 = -_172;
        float _178 = _176 + 1.0;
        float _180 = -_172;
        float _182 = _180 + 2.0;
        float _184 = -_168;
        float _186 = _162 + _184;
        float _188 = _178 * _178;
        float _190 = _168 + 1.5;
        float _192 = -_186;
        float _194 = _192 + 1.0;
        float _196 = _178 * _188;
        float _198 = -_186;
        float _200 = _198 + 2.0;
        float _202 = _182 * _182;
        float _204 = _194 * _194;
        float _206 = _172 * _172;
        float _208 = _200 * _200;
        float _210 = _194 * _204;
        float _212 = _196 * 4.0;
        float _214 = _172 * _206;
        float _216 = _166 + (-0.5);
        float _218 = _210 * 4.0;
        float _220 = -_212;
        float _222 = fma(_182, _202, _220);
        float _224 = -_196;
        float _226 = _224 + 6.0;
        float _228 = -_218;
        float _230 = fma(_200, _208, _228);
        float _232 = -_210;
        float _234 = _232 + 6.0;
        float _236 = -_222;
        float _238 = _236 + _226;
        float _240 = -_230;
        float _242 = _240 + _234;
        float _244 = _238 * 0.16666667163372039794921875;
        float _246 = _196 + _222;
        float _248 = _186 * _186;
        float _250 = _242 * 0.16666667163372039794921875;
        float _252 = _210 + _230;
        float _254 = _246 * 0.16666667163372039794921875;
        float _256 = 1.0 / _244;
        float _258 = _186 * _248;
        float _260 = _252 * 0.16666667163372039794921875;
        float _262 = _168 + (-0.5);
        float _264 = _230 * 0.16666667163372039794921875;
        float _266 = _166 + 1.5;
        float _268 = _222 * 0.16666667163372039794921875;
        float _270 = _214 * 0.16666667163372039794921875;
        float _272 = 1.0 / _260;
        float _274 = _258 * 0.16666667163372039794921875;
        float _276 = 1.0 / _254;
        float _278 = fma(_270, _256, _266);
        float _280 = 1.0 / _250;
        float _282 = fma(_264, _272, _262);
        float _284 = _282 * _174;
        float _286 = fma(_268, _276, _216);
        float _288 = _278 * _164;
        float _290 = _286 * _164;
        float _292 = fma(_274, _280, _190);
        float _294 = _292 * _174;
        float2 _793 = float2(_290, _284);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_793, float2(0.0), isnan(_793)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_793, float2(0.0), isnan(_793)), level(_134)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _808 = float2(_288, _284);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_808, float2(0.0), isnan(_808)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_808, float2(0.0), isnan(_808)), level(_134)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _823 = float2(_290, _294);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_823, float2(0.0), isnan(_823)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_823, float2(0.0), isnan(_823)), level(_134)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _838 = float2(_288, _294);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_838, float2(0.0), isnan(_838)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_838, float2(0.0), isnan(_838)), level(_134)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = 0.0 + _132;
        float _332 = precise::clamp(_330, 0.0, 1.0);
        float _334 = fma(_88, _332, _86);
        float _336 = -_310;
        float _338 = _302 + _336;
        float _340 = -_308;
        float _342 = _300 + _340;
        float _344 = -_326;
        float _346 = _318 + _344;
        float _348 = -_324;
        float _350 = _316 + _348;
        float _352 = fma(_254, _338, _310);
        float _354 = fma(_254, _342, _308);
        float _356 = fma(_254, _346, _326);
        float _358 = -_312;
        float _360 = _304 + _358;
        float _362 = -_328;
        float _364 = _320 + _362;
        float _366 = fma(_254, _350, _324);
        float _368 = -_356;
        float _370 = _368 + _352;
        float _372 = fma(_254, _360, _312);
        float _374 = fma(_254, _364, _328);
        float _376 = -_366;
        float _378 = _376 + _354;
        float _380 = fma(_260, _370, _356);
        float _382 = _332 * _88;
        float _384 = -_374;
        float _386 = _384 + _372;
        float _388 = fma(_260, _378, _366);
        float _390 = _380 * 0.586600005626678466796875;
        float _392 = 1.0 / _334;
        float _394 = fma(_260, _386, _374);
        float _396 = _124 * (*spvDescriptorSet0.fp_c3)._m0[0].w;
        float _398 = fma(_388, 0.29890000820159912109375, _390);
        float _400 = fma(_394, 0.1143999993801116943359375, _398);
        float _402 = -_394;
        float _404 = _402 + _400;
        float _406 = -_388;
        float _408 = _406 + _400;
        float _410 = -_380;
        float _412 = _410 + _400;
        float _414 = fma(_396, _404, _394);
        float _416 = fma(_396, _408, _388);
        float _418 = fma(_396, _412, _380);
        float _420 = -_414;
        float _422 = fma(_414, (*spvDescriptorSet0.fp_c3)._m0[13].z, _420);
        float _424 = -_416;
        float _426 = fma(_416, (*spvDescriptorSet0.fp_c3)._m0[13].x, _424);
        float _428 = -_418;
        float _430 = fma(_418, (*spvDescriptorSet0.fp_c3)._m0[13].y, _428);
        float _432 = fma(_124, _422, _414);
        float _434 = fma(_124, _426, _416);
        float _436 = _392 * _382;
        float _438 = fma(_124, _430, _418);
        float _440 = _432 * _382;
        float _442 = _434 * _436;
        float _444 = _438 * _436;
        float _446 = _440 * _392;
        out.m_36.x = _442;
        out.m_36.y = _444;
        out.m_36.z = _446;
        out.m_36.w = _334;
        return out;
    }
    out.m_36.x = 0.0;
    out.m_36.y = 0.0;
    out.m_36.z = 0.0;
    out.m_36.w = _86;
    return out;
}

