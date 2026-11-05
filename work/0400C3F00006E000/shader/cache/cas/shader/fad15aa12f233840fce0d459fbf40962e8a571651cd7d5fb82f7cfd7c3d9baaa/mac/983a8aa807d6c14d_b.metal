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
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
    float4 m_29 [[user(locn1)]];
};

static inline __attribute__((always_inline))
int _40(thread const int& _908, thread const int& _909, constant _10& support_buffer)
{
    int _912 = 1 + _909;
    float _914 = support_buffer._m5[_912].x;
    float _916 = abs(_914);
    bool _918 = _916 == 1.0;
    if (_918)
    {
        return _908;
    }
    float _920 = float(_908);
    float _922 = _920 / _916;
    int _924 = int(_922);
    return _924;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _44 = gl_FragCoord.w;
    float _46 = in.m_29.z;
    float _48 = gl_FragCoord.w;
    float _50 = _46 * _48;
    float _52 = in.m_29.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = 1.0 / _44;
    float _60 = _58 * _50;
    float _62 = _58 * _56;
    bool _66 = _60 != 0.0;
    bool _68 = isnan(_60);
    bool _70 = _66 || _68;
    bool _72 = isnan(0.0);
    bool _74 = _70 || _72;
    bool _76 = !_74;
    if (!_76)
    {
        float _78 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[0].y;
        float _80 = fma(_60, _78, 1.0);
        float _82 = log2(_80);
        float _84 = _82 + (-1.0);
        float _86 = trunc(_84);
        int _88 = int(_86);
        int _90 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_88), spvDescriptorSet0.fp_t_tcb_8.get_height(_88)).x;
        int _92 = _90;
        int _94 = 0;
        int _96 = _40(_92, _94, (*spvDescriptorSet0.support_buffer));
        int _98 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(_88), spvDescriptorSet0.fp_t_tcb_8.get_height(_88)).y;
        int _100 = _98;
        int _102 = 0;
        int _104 = _40(_100, _102, (*spvDescriptorSet0.support_buffer));
        float _106 = in.m_31.x;
        float _108 = gl_FragCoord.w;
        float _110 = _106 * _108;
        float _112 = in.m_31.y;
        float _114 = gl_FragCoord.w;
        float _116 = _112 * _114;
        float _118 = _58 * _110;
        float _120 = float(_96);
        float _122 = _58 * _116;
        float _124 = float(_104);
        float _126 = fma(_118, _120, -0.5);
        float _128 = fma(_122, _124, -0.5);
        float _130 = 1.0 / _120;
        float _132 = floor(_126);
        float _134 = floor(_128);
        float _136 = -_132;
        float _138 = _126 + _136;
        float _140 = 1.0 / _124;
        float _142 = _132 + (-0.5);
        float _144 = _132 + 1.5;
        float _146 = -_138;
        float _148 = _146 + 1.0;
        float _150 = -_138;
        float _152 = _150 + 2.0;
        float _154 = -_134;
        float _156 = _128 + _154;
        float _158 = _148 * _148;
        float _160 = _152 * _152;
        float _162 = _134 + (-0.5);
        float _164 = -_156;
        float _166 = _164 + 1.0;
        float _168 = _148 * _158;
        float _170 = _166 * _166;
        float _172 = _168 * 4.0;
        float _174 = -_168;
        float _176 = _174 + 6.0;
        float _178 = _166 * _170;
        float _180 = -_156;
        float _182 = _180 + 2.0;
        float _184 = -_172;
        float _186 = fma(_152, _160, _184);
        float _188 = _178 * 4.0;
        float _190 = _182 * _182;
        float _192 = -_186;
        float _194 = _192 + _176;
        float _196 = -_178;
        float _198 = _196 + 6.0;
        float _200 = -_188;
        float _202 = fma(_182, _190, _200);
        float _204 = _194 * 0.16666667163372039794921875;
        float _206 = _138 * _138;
        float _208 = -_202;
        float _210 = _208 + _198;
        float _212 = 1.0 / _204;
        float _214 = _138 * _206;
        float _216 = _210 * 0.16666667163372039794921875;
        float _218 = _168 + _186;
        float _220 = _178 + _202;
        float _222 = _156 * _156;
        float _224 = _202 * 0.16666667163372039794921875;
        float _226 = _218 * 0.16666667163372039794921875;
        float _228 = _220 * 0.16666667163372039794921875;
        float _230 = 1.0 / _216;
        float _232 = _156 * _222;
        float _234 = _134 + 1.5;
        float _236 = _186 * 0.16666667163372039794921875;
        float _238 = _214 * 0.16666667163372039794921875;
        float _240 = _232 * 0.16666667163372039794921875;
        float _242 = 1.0 / _228;
        float _244 = fma(_238, _212, _144);
        float _246 = 1.0 / _226;
        float _248 = fma(_240, _230, _234);
        float _250 = fma(_224, _242, _162);
        float _252 = _250 * _140;
        float _254 = _248 * _140;
        float _256 = fma(_236, _246, _142);
        float _258 = _256 * _130;
        float _260 = _244 * _130;
        float2 _678 = float2(_258, _252);
        float3 _264 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_678, float2(0.0), isnan(_678)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_678, float2(0.0), isnan(_678)), level(_84)).xyz;
        float _266 = _264.x;
        float _268 = _264.y;
        float _270 = _264.z;
        float2 _695 = float2(_260, _252);
        float3 _272 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_695, float2(0.0), isnan(_695)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_695, float2(0.0), isnan(_695)), level(_84)).xyz;
        float _274 = _272.x;
        float _276 = _272.y;
        float _278 = _272.z;
        float2 _710 = float2(_258, _254);
        float3 _280 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_710, float2(0.0), isnan(_710)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_710, float2(0.0), isnan(_710)), level(_84)).xyz;
        float _282 = _280.x;
        float _284 = _280.y;
        float _286 = _280.z;
        float2 _725 = float2(_260, _254);
        float3 _288 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_725, float2(0.0), isnan(_725)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_725, float2(0.0), isnan(_725)), level(_84)).xyz;
        float _290 = _288.x;
        float _292 = _288.y;
        float _294 = _288.z;
        float _296 = in.m_29.y;
        float _298 = gl_FragCoord.w;
        float _300 = _296 * _298;
        float _302 = _58 * _300;
        float _304 = -_276;
        float _306 = _268 + _304;
        float _308 = -_274;
        float _310 = _266 + _308;
        float _312 = -_278;
        float _314 = _270 + _312;
        float _316 = -_290;
        float _318 = _282 + _316;
        float _320 = -_292;
        float _322 = _284 + _320;
        float _324 = -_294;
        float _326 = _286 + _324;
        float _328 = fma(_226, _310, _274);
        float _330 = fma(_226, _318, _290);
        float _332 = 0.0 + _82;
        float _334 = precise::clamp(_332, 0.0, 1.0);
        float _336 = fma(_226, _306, _276);
        float _338 = fma(_226, _314, _278);
        float _340 = fma(_226, _322, _292);
        float _342 = fma(_226, _326, _294);
        float _344 = -_330;
        float _346 = _344 + _328;
        float _348 = fma(_302, _334, _62);
        float _350 = -_340;
        float _352 = _350 + _336;
        float _354 = -_342;
        float _356 = _354 + _338;
        float _358 = fma(_228, _346, _330);
        float _360 = 1.0 / _348;
        float _362 = fma(_228, _352, _340);
        float _364 = fma(_228, _356, _342);
        float _366 = _334 * _358;
        float _368 = _334 * _362;
        float _370 = _334 * _364;
        float _372 = -_366;
        float _374 = _372 + (*spvDescriptorSet0.fp_c3)._m0[12].x;
        float _376 = -_368;
        float _378 = _376 + (*spvDescriptorSet0.fp_c3)._m0[12].y;
        float _380 = -_370;
        float _382 = _380 + (*spvDescriptorSet0.fp_c3)._m0[12].z;
        float _384 = fma(_62, _374, _366);
        float _386 = fma(_62, _378, _368);
        float _388 = fma(_62, _382, _370);
        float _390 = _384 * _360;
        float _392 = _386 * _360;
        float _394 = _388 * _360;
        out.m_34.x = _390;
        out.m_34.y = _392;
        out.m_34.z = _394;
        out.m_34.w = _348;
        return out;
    }
    out.m_34.x = (*spvDescriptorSet0.fp_c3)._m0[12].x;
    out.m_34.y = (*spvDescriptorSet0.fp_c3)._m0[12].y;
    out.m_34.z = (*spvDescriptorSet0.fp_c3)._m0[12].z;
    out.m_34.w = _62;
    return out;
}

