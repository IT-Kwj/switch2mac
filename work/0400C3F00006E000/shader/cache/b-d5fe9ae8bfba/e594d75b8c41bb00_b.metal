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
    float4 m_32 [[color(0)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
};

static inline __attribute__((always_inline))
int _38(thread const int& _787, thread const int& _788, constant _10& support_buffer)
{
    int _791 = 1 + _788;
    float _793 = support_buffer._m5[_791].x;
    float _795 = abs(_793);
    bool _798 = _795 == 1.0;
    if (_798)
    {
        return _787;
    }
    float _800 = float(_787);
    float _802 = _800 / _795;
    int _804 = int(_802);
    return _804;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _41 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _43 = _41;
    int _45 = 0;
    int _47 = _38(_43, _45, (*spvDescriptorSet0.support_buffer));
    int _49 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _51 = _49;
    int _53 = 0;
    int _55 = _38(_51, _53, (*spvDescriptorSet0.support_buffer));
    float _58 = gl_FragCoord.w;
    float _60 = in.m_29.x;
    float _62 = gl_FragCoord.w;
    float _64 = _60 * _62;
    float _66 = in.m_29.y;
    float _68 = gl_FragCoord.w;
    float _70 = _66 * _68;
    float _72 = 1.0 / _58;
    float _74 = _72 * _64;
    float _76 = _72 * _70;
    float _78 = float(_47);
    float _80 = float(_55);
    float _82 = fma(_74, _78, -0.5);
    float _84 = fma(_76, _80, -0.5);
    float _86 = 1.0 / _78;
    float _88 = floor(_82);
    float _90 = floor(_84);
    float _92 = -_88;
    float _94 = _82 + _92;
    float _96 = 1.0 / _80;
    float _98 = -_94;
    float _100 = _98 + 1.0;
    float _102 = -_94;
    float _104 = _102 + 2.0;
    float _106 = -_90;
    float _108 = _84 + _106;
    float _110 = _100 * _100;
    float _112 = -_108;
    float _114 = _112 + 1.0;
    float _116 = _100 * _110;
    float _118 = _104 * _104;
    float _120 = _114 * _114;
    float _122 = _116 * 4.0;
    float _124 = -_116;
    float _126 = _124 + 6.0;
    float _128 = _114 * _120;
    float _130 = -_108;
    float _132 = _130 + 2.0;
    float _134 = -_122;
    float _136 = fma(_104, _118, _134);
    float _138 = _128 * 4.0;
    float _140 = _132 * _132;
    float _142 = -_136;
    float _144 = _142 + _126;
    float _146 = -_128;
    float _148 = _146 + 6.0;
    float _150 = -_138;
    float _152 = fma(_132, _140, _150);
    float _154 = _144 * 0.16666667163372039794921875;
    float _156 = in.m_29.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = -_152;
    float _164 = _162 + _148;
    float _166 = _128 + _152;
    float _168 = 1.0 / _154;
    float _170 = _94 * _94;
    float _172 = _164 * 0.16666667163372039794921875;
    float _174 = _116 + _136;
    float _176 = _166 * 0.16666667163372039794921875;
    float _178 = _152 * 0.16666667163372039794921875;
    float _180 = _94 * _170;
    float _182 = _174 * 0.16666667163372039794921875;
    float _184 = 1.0 / _176;
    float _186 = _108 * _108;
    float _188 = _88 + (-0.5);
    float _190 = _136 * 0.16666667163372039794921875;
    float _192 = _88 + 1.5;
    float _194 = _108 * _186;
    float _196 = _90 + (-0.5);
    float _198 = _90 + 1.5;
    float _200 = 1.0 / _172;
    float _202 = _194 * 0.16666667163372039794921875;
    float _204 = _180 * 0.16666667163372039794921875;
    float _206 = fma(_204, _168, _192);
    float _208 = 1.0 / _182;
    float _210 = fma(_178, _184, _196);
    float _212 = fma(_202, _200, _198);
    float _214 = _210 * _96;
    float _216 = _206 * _86;
    float _218 = _212 * _96;
    float _220 = fma(_190, _208, _188);
    float _222 = _72 * _160;
    float _224 = _220 * _86;
    float2 _583 = float2(_224, _214);
    float4 _227 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_583, float2(0.0), isnan(_583)), level(_222)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_583, float2(0.0), isnan(_583)), level(_222)).xyzw;
    float _229 = _227.x;
    float _231 = _227.y;
    float _233 = _227.z;
    float _235 = _227.w;
    float2 _604 = float2(_216, _214);
    float4 _237 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_604, float2(0.0), isnan(_604)), level(_222)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_604, float2(0.0), isnan(_604)), level(_222)).xyzw;
    float _239 = _237.x;
    float _241 = _237.y;
    float _243 = _237.z;
    float _245 = _237.w;
    float2 _621 = float2(_224, _218);
    float4 _247 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_621, float2(0.0), isnan(_621)), level(_222)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_621, float2(0.0), isnan(_621)), level(_222)).xyzw;
    float _249 = _247.x;
    float _251 = _247.y;
    float _253 = _247.z;
    float _255 = _247.w;
    float2 _638 = float2(_216, _218);
    float4 _257 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_638, float2(0.0), isnan(_638)), level(_222)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_638, float2(0.0), isnan(_638)), level(_222)).xyzw;
    float _259 = _257.x;
    float _261 = _257.y;
    float _263 = _257.z;
    float _265 = _257.w;
    float _267 = -_243;
    float _269 = _233 + _267;
    float _271 = -_239;
    float _273 = _229 + _271;
    float _275 = -_241;
    float _277 = _231 + _275;
    float _279 = -_245;
    float _281 = _235 + _279;
    float _283 = fma(_182, _269, _243);
    float _285 = -_261;
    float _287 = _251 + _285;
    float _289 = -_259;
    float _291 = _249 + _289;
    float _293 = -_263;
    float _295 = _253 + _293;
    float _297 = -_265;
    float _299 = _255 + _297;
    float _301 = fma(_182, _273, _239);
    float _303 = fma(_182, _277, _241);
    float _305 = fma(_182, _281, _245);
    float _307 = fma(_182, _291, _259);
    float _309 = fma(_182, _287, _261);
    float _311 = fma(_182, _295, _263);
    float _313 = fma(_182, _299, _265);
    float _315 = -_307;
    float _317 = _315 + _301;
    float _319 = -_309;
    float _321 = _319 + _303;
    float _323 = -_311;
    float _325 = _323 + _283;
    float _327 = -_313;
    float _329 = _327 + _305;
    float _331 = fma(_176, _317, _307);
    float _333 = fma(_176, _321, _309);
    float _335 = fma(_176, _325, _311);
    float _337 = fma(_176, _329, _313);
    float _339 = _331 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _341 = _333 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _343 = _335 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _345 = _337 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_32.x = _339;
    out.m_32.y = _341;
    out.m_32.z = _343;
    out.m_32.w = _345;
    return out;
}

