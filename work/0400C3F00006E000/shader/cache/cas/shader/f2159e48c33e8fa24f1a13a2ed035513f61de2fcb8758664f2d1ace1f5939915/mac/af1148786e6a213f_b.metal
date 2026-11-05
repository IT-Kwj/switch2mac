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
int _42(thread const int& _943, thread const int& _944, constant _10& support_buffer)
{
    int _947 = 1 + _944;
    float _949 = support_buffer._m5[_947].x;
    float _951 = abs(_949);
    bool _953 = _951 == 1.0;
    if (_953)
    {
        return _943;
    }
    float _955 = float(_943);
    float _957 = _955 / _951;
    int _959 = int(_957);
    return _959;
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
    float2 _440 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_440, float2(0.0), isnan(_440))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_440, float2(0.0), isnan(_440))).x;
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
    float _102 = precise::max(_100, _90);
    bool _106 = _102 != 0.0;
    bool _108 = isnan(_102);
    bool _110 = _106 || _108;
    bool _112 = isnan(0.0);
    bool _114 = _110 || _112;
    float _116 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _118 = precise::clamp(_116, 0.0, 1.0);
    float _120 = fma(_66, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = precise::min(_118, _122);
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
        float _228 = -_216;
        float _230 = _228 + _204;
        float _232 = _194 + _216;
        float _234 = _216 * 0.16666667163372039794921875;
        float _236 = _208 + _226;
        float _238 = -_226;
        float _240 = _238 + _220;
        float _242 = _230 * 0.16666667163372039794921875;
        float _244 = _232 * 0.16666667163372039794921875;
        float _246 = _236 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = 1.0 / _242;
        float _252 = _172 * _172;
        float _254 = _184 * _184;
        float _256 = _226 * 0.16666667163372039794921875;
        float _258 = _172 * _252;
        float _260 = _168 + (-0.5);
        float _262 = _184 * _254;
        float _264 = 1.0 / _246;
        float _266 = _166 + (-0.5);
        float _268 = _166 + 1.5;
        float _270 = _258 * 0.16666667163372039794921875;
        float _272 = _168 + 1.5;
        float _274 = _262 * 0.16666667163372039794921875;
        float _276 = 1.0 / _248;
        float _278 = fma(_270, _250, _268);
        float _280 = _278 * _164;
        float _282 = 1.0 / _244;
        float _284 = fma(_256, _264, _260);
        float _286 = _284 * _222;
        float _288 = fma(_274, _276, _272);
        float _290 = _288 * _222;
        float _292 = fma(_234, _282, _266);
        float _294 = _292 * _164;
        float2 _753 = float2(_294, _286);
        float3 _298 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_753, float2(0.0), isnan(_753)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_753, float2(0.0), isnan(_753)), level(_134)).xyz;
        float _300 = _298.x;
        float _302 = _298.y;
        float _304 = _298.z;
        float2 _768 = float2(_280, _286);
        float3 _306 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_768, float2(0.0), isnan(_768)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_768, float2(0.0), isnan(_768)), level(_134)).xyz;
        float _308 = _306.x;
        float _310 = _306.y;
        float _312 = _306.z;
        float2 _783 = float2(_294, _290);
        float3 _314 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_783, float2(0.0), isnan(_783)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_783, float2(0.0), isnan(_783)), level(_134)).xyz;
        float _316 = _314.x;
        float _318 = _314.y;
        float _320 = _314.z;
        float2 _798 = float2(_280, _290);
        float3 _322 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_798, float2(0.0), isnan(_798)), level(_134)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_798, float2(0.0), isnan(_798)), level(_134)).xyz;
        float _324 = _322.x;
        float _326 = _322.y;
        float _328 = _322.z;
        float _330 = 0.0 + _132;
        float _332 = precise::clamp(_330, 0.0, 1.0);
        float _334 = fma(_88, _332, _86);
        float _336 = -_308;
        float _338 = _300 + _336;
        float _340 = -_310;
        float _342 = _302 + _340;
        float _344 = fma(_244, _338, _308);
        float _346 = -_312;
        float _348 = _304 + _346;
        float _350 = -_324;
        float _352 = _316 + _350;
        float _354 = -_326;
        float _356 = _318 + _354;
        float _358 = -_328;
        float _360 = _320 + _358;
        float _362 = fma(_244, _342, _310);
        float _364 = fma(_244, _352, _324);
        float _366 = fma(_244, _348, _312);
        float _368 = fma(_244, _356, _326);
        float _370 = fma(_244, _360, _328);
        float _372 = -_364;
        float _374 = _372 + _344;
        float _376 = -_368;
        float _378 = _376 + _362;
        float _380 = -_370;
        float _382 = _380 + _366;
        float _384 = fma(_246, _374, _364);
        float _386 = fma(_246, _378, _368);
        float _388 = fma(_246, _382, _370);
        float _390 = -_384;
        float _392 = fma(_384, (*spvDescriptorSet0.fp_c3)._m0[13].x, _390);
        float _394 = -_386;
        float _396 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[13].y, _394);
        float _398 = -_388;
        float _400 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[13].z, _398);
        float _402 = fma(_124, _392, _384);
        float _404 = fma(_124, _396, _386);
        float _406 = fma(_124, _400, _388);
        out.m_36.x = _402;
        out.m_36.y = _404;
        out.m_36.z = _406;
        out.m_36.w = _334;
        return out;
    }
    discard_fragment();
    return out;
}

