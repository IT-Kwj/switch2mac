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
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_36 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _42(thread const int& _959, thread const int& _960, constant _10& support_buffer)
{
    int _963 = 1 + _960;
    float _965 = support_buffer._m5[_963].x;
    float _967 = abs(_965);
    bool _969 = _967 == 1.0;
    if (_969)
    {
        return _959;
    }
    float _971 = float(_959);
    float _973 = _971 / _967;
    int _975 = int(_973);
    return _975;
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
    float2 _442 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_442, float2(0.0), isnan(_442))).x;
    float _68 = -_66;
    float _70 = fma(_68, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _72 = 1.0 / _70;
    bool _76 = _72 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_76)
    {
        discard_fragment();
    }
    if (_76)
    {
        out.m_34.x = 0.0;
        out.m_34.y = 0.0;
        out.m_34.z = 0.0;
        out.m_34.w = 0.0;
        return out;
    }
    float _78 = in.m_36.z;
    float _80 = gl_FragCoord.w;
    float _82 = _78 * _80;
    float _84 = in.m_36.x;
    float _86 = gl_FragCoord.w;
    float _88 = _84 * _86;
    float _90 = in.m_36.y;
    float _92 = gl_FragCoord.w;
    float _94 = _90 * _92;
    float _96 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _98 = precise::clamp(_96, 0.0, 1.0);
    float _100 = _60 * _82;
    float _102 = precise::max(_98, _100);
    float _104 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].z, (*spvDescriptorSet0.fp_c3)._m0[5].z);
    float _106 = precise::clamp(_104, 0.0, 1.0);
    float _108 = _60 * _88;
    bool _110 = _102 != 0.0;
    bool _112 = isnan(_102);
    bool _114 = _110 || _112;
    bool _116 = isnan(0.0);
    bool _118 = _114 || _116;
    float _120 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].w, (*spvDescriptorSet0.fp_c3)._m0[5].w);
    float _122 = precise::clamp(_120, 0.0, 1.0);
    float _124 = _60 * _94;
    float _126 = precise::min(_106, _122);
    bool _128 = !_118;
    if (!_128)
    {
        float _130 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _132 = fma(_102, _130, 1.0);
        float _134 = log2(_132);
        float _136 = _134 + (-1.0);
        float _138 = trunc(_136);
        int _140 = int(_138);
        int _142 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).x;
        int _144 = _142;
        int _146 = 1;
        int _148 = _42(_144, _146, (*spvDescriptorSet0.support_buffer));
        int _150 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_140), spvDescriptorSet0.fp_t_tcb_A.get_height(_140)).y;
        int _152 = _150;
        int _154 = 1;
        int _156 = _42(_152, _154, (*spvDescriptorSet0.support_buffer));
        float _158 = float(_148);
        float _160 = float(_156);
        float _162 = fma(_62, _158, -0.5);
        float _164 = fma(_64, _160, -0.5);
        float _166 = 1.0 / _158;
        float _168 = floor(_162);
        float _170 = floor(_164);
        float _172 = -_168;
        float _174 = _162 + _172;
        float _176 = -_174;
        float _178 = _176 + 1.0;
        float _180 = -_174;
        float _182 = _180 + 2.0;
        float _184 = -_170;
        float _186 = _164 + _184;
        float _188 = _178 * _178;
        float _190 = _182 * _182;
        float _192 = -_186;
        float _194 = _192 + 1.0;
        float _196 = _178 * _188;
        float _198 = -_186;
        float _200 = _198 + 2.0;
        float _202 = _194 * _194;
        float _204 = -_196;
        float _206 = _204 + 6.0;
        float _208 = _200 * _200;
        float _210 = _194 * _202;
        float _212 = _196 * 4.0;
        float _214 = _210 * 4.0;
        float _216 = -_212;
        float _218 = fma(_182, _190, _216);
        float _220 = -_210;
        float _222 = _220 + 6.0;
        float _224 = 1.0 / _160;
        float _226 = -_214;
        float _228 = fma(_200, _208, _226);
        float _230 = -_218;
        float _232 = _230 + _206;
        float _234 = _196 + _218;
        float _236 = _218 * 0.16666667163372039794921875;
        float _238 = _210 + _228;
        float _240 = -_228;
        float _242 = _240 + _222;
        float _244 = _232 * 0.16666667163372039794921875;
        float _246 = _234 * 0.16666667163372039794921875;
        float _248 = _238 * 0.16666667163372039794921875;
        float _250 = _242 * 0.16666667163372039794921875;
        float _252 = 1.0 / _244;
        float _254 = _174 * _174;
        float _256 = _186 * _186;
        float _258 = _228 * 0.16666667163372039794921875;
        float _260 = _174 * _254;
        float _262 = _170 + (-0.5);
        float _264 = _186 * _256;
        float _266 = 1.0 / _248;
        float _268 = _168 + (-0.5);
        float _270 = _168 + 1.5;
        float _272 = _260 * 0.16666667163372039794921875;
        float _274 = _170 + 1.5;
        float _276 = _264 * 0.16666667163372039794921875;
        float _278 = 1.0 / _250;
        float _280 = fma(_272, _252, _270);
        float _282 = _280 * _166;
        float _284 = 1.0 / _246;
        float _286 = fma(_258, _266, _262);
        float _288 = _286 * _224;
        float _290 = fma(_276, _278, _274);
        float _292 = _290 * _224;
        float _294 = fma(_236, _284, _268);
        float _296 = _294 * _166;
        float2 _770 = float2(_296, _288);
        float3 _300 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_770, float2(0.0), isnan(_770)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_770, float2(0.0), isnan(_770)), level(_136)).xyz;
        float _302 = _300.x;
        float _304 = _300.y;
        float _306 = _300.z;
        float2 _785 = float2(_282, _288);
        float3 _308 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_785, float2(0.0), isnan(_785)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_785, float2(0.0), isnan(_785)), level(_136)).xyz;
        float _310 = _308.x;
        float _312 = _308.y;
        float _314 = _308.z;
        float2 _800 = float2(_296, _292);
        float3 _316 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_800, float2(0.0), isnan(_800)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_800, float2(0.0), isnan(_800)), level(_136)).xyz;
        float _318 = _316.x;
        float _320 = _316.y;
        float _322 = _316.z;
        float2 _815 = float2(_282, _292);
        float3 _324 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_815, float2(0.0), isnan(_815)), level(_136)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_815, float2(0.0), isnan(_815)), level(_136)).xyz;
        float _326 = _324.x;
        float _328 = _324.y;
        float _330 = _324.z;
        float _332 = 0.0 + _134;
        float _334 = precise::clamp(_332, 0.0, 1.0);
        float _336 = fma(_124, _334, _108);
        float _338 = -_310;
        float _340 = _302 + _338;
        float _342 = -_312;
        float _344 = _304 + _342;
        float _346 = fma(_246, _340, _310);
        float _348 = -_314;
        float _350 = _306 + _348;
        float _352 = -_326;
        float _354 = _318 + _352;
        float _356 = -_328;
        float _358 = _320 + _356;
        float _360 = -_330;
        float _362 = _322 + _360;
        float _364 = fma(_246, _344, _312);
        float _366 = fma(_246, _354, _326);
        float _368 = fma(_246, _350, _314);
        float _370 = fma(_246, _358, _328);
        float _372 = fma(_246, _362, _330);
        float _374 = -_366;
        float _376 = _374 + _346;
        float _378 = -_370;
        float _380 = _378 + _364;
        float _382 = -_372;
        float _384 = _382 + _368;
        float _386 = fma(_248, _376, _366);
        float _388 = fma(_248, _380, _370);
        float _390 = fma(_248, _384, _372);
        float _392 = -_386;
        float _394 = fma(_386, (*spvDescriptorSet0.fp_c3)._m0[13].x, _392);
        float _396 = -_388;
        float _398 = fma(_388, (*spvDescriptorSet0.fp_c3)._m0[13].y, _396);
        float _400 = -_390;
        float _402 = fma(_390, (*spvDescriptorSet0.fp_c3)._m0[13].z, _400);
        float _404 = fma(_126, _394, _386);
        float _406 = fma(_126, _398, _388);
        float _408 = fma(_126, _402, _390);
        out.m_34.x = _404;
        out.m_34.y = _406;
        out.m_34.z = _408;
        out.m_34.w = _336;
        return out;
    }
    discard_fragment();
    return out;
}

