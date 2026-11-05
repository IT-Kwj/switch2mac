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
int _42(thread const int& _934, thread const int& _935, constant _10& support_buffer)
{
    int _938 = 1 + _935;
    float _940 = support_buffer._m5[_938].x;
    float _942 = abs(_940);
    bool _944 = _942 == 1.0;
    if (_944)
    {
        return _934;
    }
    float _946 = float(_934);
    float _948 = _946 / _942;
    int _950 = int(_948);
    return _950;
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
    float2 _434 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_434, float2(0.0), isnan(_434))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_434, float2(0.0), isnan(_434))).x;
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
    float _100 = fma(_72, (*spvDescriptorSet0.fp_c3)._m0[4].y, (*spvDescriptorSet0.fp_c3)._m0[5].y);
    float _102 = precise::clamp(_100, 0.0, 1.0);
    float _104 = precise::max(_98, _102);
    float _106 = _60 * _82;
    float _108 = precise::max(_104, _106);
    float _110 = _60 * _88;
    float _112 = _60 * _94;
    bool _114 = _108 != 0.0;
    bool _116 = isnan(_108);
    bool _118 = _114 || _116;
    bool _120 = isnan(0.0);
    bool _122 = _118 || _120;
    bool _124 = !_122;
    if (!_124)
    {
        float _126 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _128 = fma(_108, _126, 1.0);
        float _130 = log2(_128);
        float _132 = _130 + (-1.0);
        float _134 = trunc(_132);
        int _136 = int(_134);
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).x;
        int _140 = _138;
        int _142 = 1;
        int _144 = _42(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).y;
        int _148 = _146;
        int _150 = 1;
        int _152 = _42(_148, _150, (*spvDescriptorSet0.support_buffer));
        float _154 = float(_144);
        float _156 = float(_152);
        float _158 = fma(_62, _154, -0.5);
        float _160 = fma(_64, _156, -0.5);
        float _162 = floor(_158);
        float _164 = floor(_160);
        float _166 = -_162;
        float _168 = _158 + _166;
        float _170 = 1.0 / _156;
        float _172 = -_168;
        float _174 = _172 + 1.0;
        float _176 = -_168;
        float _178 = _176 + 2.0;
        float _180 = -_164;
        float _182 = _160 + _180;
        float _184 = _174 * _174;
        float _186 = _164 + (-0.5);
        float _188 = _164 + 1.5;
        float _190 = -_182;
        float _192 = _190 + 1.0;
        float _194 = _174 * _184;
        float _196 = -_182;
        float _198 = _196 + 2.0;
        float _200 = _178 * _178;
        float _202 = _192 * _192;
        float _204 = 1.0 / _154;
        float _206 = _198 * _198;
        float _208 = _192 * _202;
        float _210 = _194 * 4.0;
        float _212 = _208 * 4.0;
        float _214 = -_210;
        float _216 = fma(_178, _200, _214);
        float _218 = -_194;
        float _220 = _218 + 6.0;
        float _222 = -_212;
        float _224 = fma(_198, _206, _222);
        float _226 = -_208;
        float _228 = _226 + 6.0;
        float _230 = -_216;
        float _232 = _230 + _220;
        float _234 = _194 + _216;
        float _236 = _208 + _224;
        float _238 = -_224;
        float _240 = _238 + _228;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = _234 * 0.16666667163372039794921875;
        float _246 = _236 * 0.16666667163372039794921875;
        float _248 = _240 * 0.16666667163372039794921875;
        float _250 = _168 * _168;
        float _252 = 1.0 / _244;
        float _254 = _182 * _182;
        float _256 = _224 * 0.16666667163372039794921875;
        float _258 = _168 * _250;
        float _260 = _216 * 0.16666667163372039794921875;
        float _262 = _182 * _254;
        float _264 = _162 + (-0.5);
        float _266 = _162 + 1.5;
        float _268 = 1.0 / _246;
        float _270 = _258 * 0.16666667163372039794921875;
        float _272 = _262 * 0.16666667163372039794921875;
        float _274 = 1.0 / _242;
        float _276 = fma(_260, _252, _264);
        float _278 = 1.0 / _248;
        float _280 = fma(_256, _268, _186);
        float _282 = fma(_270, _274, _266);
        float _284 = _280 * _170;
        float _286 = fma(_272, _278, _188);
        float _288 = _276 * _204;
        float _290 = _282 * _204;
        float _292 = _286 * _170;
        float2 _754 = float2(_288, _284);
        float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_754, float2(0.0), isnan(_754)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_754, float2(0.0), isnan(_754)), level(_132)).xyz;
        float _298 = _296.x;
        float _300 = _296.y;
        float _302 = _296.z;
        float2 _769 = float2(_290, _284);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_769, float2(0.0), isnan(_769)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_769, float2(0.0), isnan(_769)), level(_132)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _784 = float2(_288, _292);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_784, float2(0.0), isnan(_784)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_784, float2(0.0), isnan(_784)), level(_132)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float2 _799 = float2(_290, _292);
        float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_799, float2(0.0), isnan(_799)), level(_132)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_799, float2(0.0), isnan(_799)), level(_132)).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        float _328 = 0.0 + _130;
        float _330 = precise::clamp(_328, 0.0, 1.0);
        float _332 = fma(_112, _330, _110);
        float _334 = _330 * _112;
        float _336 = 1.0 / _332;
        float _338 = -_310;
        float _340 = _302 + _338;
        float _342 = -_306;
        float _344 = _298 + _342;
        float _346 = -_326;
        float _348 = _318 + _346;
        float _350 = fma(_244, _340, _310);
        float _352 = -_322;
        float _354 = _314 + _352;
        float _356 = -_308;
        float _358 = _300 + _356;
        float _360 = -_324;
        float _362 = _316 + _360;
        float _364 = fma(_244, _348, _326);
        float _366 = fma(_244, _344, _306);
        float _368 = fma(_244, _354, _322);
        float _370 = fma(_244, _358, _308);
        float _372 = fma(_244, _362, _324);
        float _374 = -_364;
        float _376 = _374 + _350;
        float _378 = -_368;
        float _380 = _378 + _366;
        float _382 = _336 * _334;
        float _384 = -_372;
        float _386 = _384 + _370;
        float _388 = fma(_246, _376, _364);
        float _390 = fma(_246, _380, _368);
        float _392 = fma(_246, _386, _372);
        float _394 = _388 * _334;
        float _396 = _390 * _382;
        float _398 = _392 * _382;
        float _400 = _394 * _336;
        out.m_34.x = _396;
        out.m_34.y = _398;
        out.m_34.z = _400;
        out.m_34.w = _332;
        return out;
    }
    out.m_34.x = 0.0;
    out.m_34.y = 0.0;
    out.m_34.z = 0.0;
    out.m_34.w = _110;
    return out;
}

