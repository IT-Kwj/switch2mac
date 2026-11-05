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
    float4 m_36 [[color(0)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
    float4 m_38 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _44(thread const int& _989, thread const int& _990, constant _10& support_buffer)
{
    int _993 = 1 + _990;
    float _995 = support_buffer._m5[_993].x;
    float _997 = abs(_995);
    bool _999 = _997 == 1.0;
    if (_999)
    {
        return _989;
    }
    float _1001 = float(_989);
    float _1003 = _1001 / _997;
    int _1005 = int(_1003);
    return _1005;
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
    float2 _452 = float2(_64, _66);
    float _68 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_452, float2(0.0), isnan(_452))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_452, float2(0.0), isnan(_452))).x;
    float _70 = -_68;
    float _72 = fma(_70, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _74 = 1.0 / _72;
    bool _78 = _74 >= (*spvDescriptorSet0.fp_c3)._m0[0].z;
    if (_78)
    {
        discard_fragment();
    }
    float2 _484 = float2(_64, _66);
    float _80 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_484, float2(0.0), isnan(_484))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_484, float2(0.0), isnan(_484))).x;
    float _82 = fma(_74, (*spvDescriptorSet0.fp_c3)._m0[4].x, (*spvDescriptorSet0.fp_c3)._m0[5].x);
    float _84 = precise::clamp(_82, 0.0, 1.0);
    if (_78)
    {
        out.m_36.x = 0.0;
        out.m_36.y = 0.0;
        out.m_36.z = 0.0;
        out.m_36.w = 0.0;
        return out;
    }
    float _86 = in.m_38.z;
    float _88 = gl_FragCoord.w;
    float _90 = _86 * _88;
    float _92 = in.m_38.x;
    float _94 = gl_FragCoord.w;
    float _96 = _92 * _94;
    float _98 = in.m_38.y;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = precise::max(_80, _84);
    float _106 = _62 * _90;
    float _108 = _62 * _96;
    float _110 = _62 * _102;
    float _112 = precise::max(_104, _106);
    bool _114 = _112 != 0.0;
    bool _116 = isnan(_112);
    bool _118 = _114 || _116;
    bool _120 = isnan(0.0);
    bool _122 = _118 || _120;
    bool _124 = !_122;
    if (!_124)
    {
        float _126 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _128 = fma(_112, _126, 1.0);
        float _130 = log2(_128);
        float _132 = _130 + (-1.0);
        float _134 = trunc(_132);
        int _136 = int(_134);
        int _138 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).x;
        int _140 = _138;
        int _142 = 2;
        int _144 = _44(_140, _142, (*spvDescriptorSet0.support_buffer));
        int _146 = int2(spvDescriptorSet0.fp_t_tcb_A.get_width(_136), spvDescriptorSet0.fp_t_tcb_A.get_height(_136)).y;
        int _148 = _146;
        int _150 = 2;
        int _152 = _44(_148, _150, (*spvDescriptorSet0.support_buffer));
        float _154 = float(_144);
        float _156 = float(_152);
        float _158 = fma(_64, _154, -0.5);
        float _160 = fma(_66, _156, -0.5);
        float _162 = 1.0 / _154;
        float _164 = floor(_158);
        float _166 = floor(_160);
        float _168 = -_164;
        float _170 = _158 + _168;
        float _172 = -_170;
        float _174 = _172 + 1.0;
        float _176 = -_170;
        float _178 = _176 + 2.0;
        float _180 = -_166;
        float _182 = _160 + _180;
        float _184 = _174 * _174;
        float _186 = -_182;
        float _188 = _186 + 1.0;
        float _190 = _174 * _184;
        float _192 = -_182;
        float _194 = _192 + 2.0;
        float _196 = _178 * _178;
        float _198 = _188 * _188;
        float _200 = _190 * 4.0;
        float _202 = -_190;
        float _204 = _202 + 6.0;
        float _206 = _188 * _198;
        float _208 = _194 * _194;
        float _210 = -_200;
        float _212 = fma(_178, _196, _210);
        float _214 = _206 * 4.0;
        float _216 = 1.0 / _156;
        float _218 = -_212;
        float _220 = _218 + _204;
        float _222 = -_214;
        float _224 = fma(_194, _208, _222);
        float _226 = -_206;
        float _228 = _226 + 6.0;
        float _230 = _220 * 0.16666667163372039794921875;
        float _232 = _190 + _212;
        float _234 = _170 * _170;
        float _236 = -_224;
        float _238 = _236 + _228;
        float _240 = _182 * _182;
        float _242 = _232 * 0.16666667163372039794921875;
        float _244 = 1.0 / _230;
        float _246 = _238 * 0.16666667163372039794921875;
        float _248 = _206 + _224;
        float _250 = _170 * _234;
        float _252 = _182 * _240;
        float _254 = _166 + (-0.5);
        float _256 = _248 * 0.16666667163372039794921875;
        float _258 = _224 * 0.16666667163372039794921875;
        float _260 = 1.0 / _246;
        float _262 = _164 + (-0.5);
        float _264 = _164 + 1.5;
        float _266 = _166 + 1.5;
        float _268 = _250 * 0.16666667163372039794921875;
        float _270 = _252 * 0.16666667163372039794921875;
        float _272 = _212 * 0.16666667163372039794921875;
        float _274 = 1.0 / _256;
        float _276 = fma(_268, _244, _264);
        float _278 = _276 * _162;
        float _280 = 1.0 / _242;
        float _282 = fma(_270, _260, _266);
        float _284 = _282 * _216;
        float _286 = fma(_258, _274, _254);
        float _288 = _286 * _216;
        float _290 = fma(_272, _280, _262);
        float _292 = _290 * _162;
        float2 _772 = float2(_292, _288);
        float3 _296 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_772, float2(0.0), isnan(_772)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_772, float2(0.0), isnan(_772)), level(_132)).xyz;
        float _298 = _296.x;
        float _300 = _296.y;
        float _302 = _296.z;
        float2 _787 = float2(_278, _288);
        float3 _304 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_787, float2(0.0), isnan(_787)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_787, float2(0.0), isnan(_787)), level(_132)).xyz;
        float _306 = _304.x;
        float _308 = _304.y;
        float _310 = _304.z;
        float2 _802 = float2(_292, _284);
        float3 _312 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_802, float2(0.0), isnan(_802)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_802, float2(0.0), isnan(_802)), level(_132)).xyz;
        float _314 = _312.x;
        float _316 = _312.y;
        float _318 = _312.z;
        float2 _817 = float2(_278, _284);
        float3 _320 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_817, float2(0.0), isnan(_817)), level(_132)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_817, float2(0.0), isnan(_817)), level(_132)).xyz;
        float _322 = _320.x;
        float _324 = _320.y;
        float _326 = _320.z;
        float _328 = -_306;
        float _330 = _298 + _328;
        float _332 = -_308;
        float _334 = _300 + _332;
        float _336 = -_322;
        float _338 = _314 + _336;
        float _340 = -_310;
        float _342 = _302 + _340;
        float _344 = -_324;
        float _346 = _316 + _344;
        float _348 = -_326;
        float _350 = _318 + _348;
        float _352 = 0.0 + _130;
        float _354 = precise::clamp(_352, 0.0, 1.0);
        float _356 = fma(_242, _330, _306);
        float _358 = fma(_242, _334, _308);
        float _360 = fma(_242, _342, _310);
        float _362 = fma(_242, _338, _322);
        float _364 = fma(_242, _346, _324);
        float _366 = fma(_242, _350, _326);
        float _368 = fma(_110, _354, _108);
        float _370 = -_362;
        float _372 = _370 + _356;
        float _374 = -_364;
        float _376 = _374 + _358;
        float _378 = -_366;
        float _380 = _378 + _360;
        float _382 = 1.0 / _368;
        float _384 = fma(_256, _372, _362);
        float _386 = fma(_256, _376, _364);
        float _388 = fma(_256, _380, _366);
        float _390 = _354 * _384;
        float _392 = _354 * _386;
        float _394 = _354 * _388;
        float _396 = -_390;
        float _398 = _396 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _400 = -_392;
        float _402 = _400 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _404 = -_394;
        float _406 = _404 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _408 = fma(_108, _398, _390);
        float _410 = fma(_108, _402, _392);
        float _412 = fma(_108, _406, _394);
        float _414 = _408 * _382;
        float _416 = _410 * _382;
        float _418 = _412 * _382;
        out.m_36.x = _414;
        out.m_36.y = _416;
        out.m_36.z = _418;
        out.m_36.w = _368;
        return out;
    }
    out.m_36.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_36.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_36.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_36.w = _108;
    return out;
}

