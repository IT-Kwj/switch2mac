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
};

static inline __attribute__((always_inline))
int _40(thread const int& _856, thread const int& _857, constant _10& support_buffer)
{
    int _860 = 1 + _857;
    float _862 = support_buffer._m5[_860].x;
    float _864 = abs(_862);
    bool _867 = _864 == 1.0;
    if (_867)
    {
        return _856;
    }
    float _869 = float(_856);
    float _871 = _869 / _864;
    int _873 = int(_871);
    return _873;
}

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    int _43 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).x;
    int _45 = _43;
    int _47 = 0;
    int _49 = _40(_45, _47, (*spvDescriptorSet0.support_buffer));
    int _51 = int2(spvDescriptorSet0.fp_t_tcb_8.get_width(), spvDescriptorSet0.fp_t_tcb_8.get_height()).y;
    int _53 = _51;
    int _55 = 0;
    int _57 = _40(_53, _55, (*spvDescriptorSet0.support_buffer));
    float _60 = gl_FragCoord.w;
    float _62 = in.m_31.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = in.m_31.y;
    float _70 = gl_FragCoord.w;
    float _72 = _68 * _70;
    float _74 = 1.0 / _60;
    float _76 = _74 * _66;
    float _78 = _74 * _72;
    float _80 = float(_49);
    float _82 = float(_57);
    float _84 = fma(_76, _80, -0.5);
    float _86 = fma(_78, _82, -0.5);
    float _88 = floor(_84);
    float _90 = floor(_86);
    float _92 = -_88;
    float _94 = _84 + _92;
    float _96 = 1.0 / _82;
    float _98 = -_94;
    float _100 = _98 + 1.0;
    float _102 = -_94;
    float _104 = _102 + 2.0;
    float _106 = -_90;
    float _108 = _86 + _106;
    float _110 = _100 * _100;
    float _112 = _104 * _104;
    float _114 = -_108;
    float _116 = _114 + 1.0;
    float _118 = _100 * _110;
    float _120 = -_108;
    float _122 = _120 + 2.0;
    float _124 = 1.0 / _80;
    float _126 = _116 * _116;
    float _128 = _108 * _108;
    float _130 = _122 * _122;
    float _132 = _116 * _126;
    float _134 = _118 * 4.0;
    float _136 = _108 * _128;
    float _138 = _88 + (-0.5);
    float _140 = _132 * 4.0;
    float _142 = -_134;
    float _144 = fma(_104, _112, _142);
    float _146 = -_118;
    float _148 = _146 + 6.0;
    float _150 = _88 + 1.5;
    float _152 = -_140;
    float _154 = fma(_122, _130, _152);
    float _156 = -_132;
    float _158 = _156 + 6.0;
    float _160 = -_144;
    float _162 = _160 + _148;
    float _164 = _136 * 0.16666667163372039794921875;
    float _166 = -_154;
    float _168 = _166 + _158;
    float _170 = _162 * 0.16666667163372039794921875;
    float _172 = _118 + _144;
    float _174 = _144 * 0.16666667163372039794921875;
    float _176 = _168 * 0.16666667163372039794921875;
    float _178 = _132 + _154;
    float _180 = _172 * 0.16666667163372039794921875;
    float _182 = 1.0 / _170;
    float _184 = _94 * _94;
    float _186 = _178 * 0.16666667163372039794921875;
    float _188 = _154 * 0.16666667163372039794921875;
    float _190 = _94 * _184;
    float _192 = _90 + 1.5;
    float _194 = 1.0 / _180;
    float _196 = _190 * 0.16666667163372039794921875;
    float _198 = 1.0 / _186;
    float _200 = fma(_196, _182, _150);
    float _202 = _200 * _124;
    float _204 = 1.0 / _176;
    float _206 = fma(_174, _194, _138);
    float _208 = _206 * _124;
    float _210 = _90 + (-0.5);
    float _212 = fma(_188, _198, _210);
    float _214 = fma(_164, _204, _192);
    float _216 = _212 * _96;
    float _218 = _214 * _96;
    float2 _593 = float2(_208, _216);
    float4 _221 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_593, float2(0.0), isnan(_593))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_593, float2(0.0), isnan(_593))).xyzw;
    float _223 = _221.x;
    float _225 = _221.y;
    float _227 = _221.z;
    float _229 = _221.w;
    float2 _613 = float2(_202, _216);
    float4 _231 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_613, float2(0.0), isnan(_613))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_613, float2(0.0), isnan(_613))).xyzw;
    float _233 = _231.x;
    float _235 = _231.y;
    float _237 = _231.z;
    float _239 = _231.w;
    float2 _629 = float2(_76, _78);
    float4 _241 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_629, float2(0.0), isnan(_629))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_629, float2(0.0), isnan(_629))).xyzw;
    float _243 = _241.x;
    float _245 = _241.y;
    float _247 = _241.z;
    float _249 = _241.w;
    float2 _645 = float2(_208, _218);
    float4 _251 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_645, float2(0.0), isnan(_645))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_645, float2(0.0), isnan(_645))).xyzw;
    float _253 = _251.x;
    float _255 = _251.y;
    float _257 = _251.z;
    float _259 = _251.w;
    float2 _661 = float2(_202, _218);
    float4 _261 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_661, float2(0.0), isnan(_661))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_661, float2(0.0), isnan(_661))).xyzw;
    float _263 = _261.x;
    float _265 = _261.y;
    float _267 = _261.z;
    float _269 = _261.w;
    float _271 = -_233;
    float _273 = _223 + _271;
    float _275 = -_235;
    float _277 = _225 + _275;
    float _279 = -_237;
    float _281 = _227 + _279;
    float _283 = -_239;
    float _285 = _229 + _283;
    float _287 = fma(_180, _273, _233);
    float _289 = fma(_245, (*spvDescriptorSet0.fp_c3)._m0[6].y, (*spvDescriptorSet0.fp_c3)._m0[7].y);
    float _291 = fma(_180, _285, _239);
    float _293 = -_263;
    float _295 = _253 + _293;
    float _297 = fma(_247, (*spvDescriptorSet0.fp_c3)._m0[6].z, (*spvDescriptorSet0.fp_c3)._m0[7].z);
    float _299 = -_265;
    float _301 = _255 + _299;
    float _303 = fma(_249, (*spvDescriptorSet0.fp_c3)._m0[6].w, (*spvDescriptorSet0.fp_c3)._m0[7].w);
    float _305 = -_267;
    float _307 = _257 + _305;
    float _309 = -_269;
    float _311 = _259 + _309;
    float _313 = fma(_180, _277, _235);
    float _315 = fma(_180, _281, _237);
    float _317 = fma(_180, _295, _263);
    float _319 = fma(_180, _301, _265);
    float _321 = fma(_180, _307, _267);
    float _323 = fma(_180, _311, _269);
    float _325 = -_319;
    float _327 = _325 + _313;
    float _329 = -_321;
    float _331 = _329 + _315;
    float _333 = -_317;
    float _335 = _333 + _287;
    float _337 = -_323;
    float _339 = _337 + _291;
    float _341 = fma(_186, _327, _319);
    float _343 = fma(_186, _331, _321);
    float _345 = fma(_243, (*spvDescriptorSet0.fp_c3)._m0[6].x, (*spvDescriptorSet0.fp_c3)._m0[7].x);
    float _347 = fma(_186, _335, _317);
    float _349 = fma(_186, _339, _323);
    float _351 = fma(_341, (*spvDescriptorSet0.fp_c3)._m0[5].y, _289);
    float _353 = fma(_343, (*spvDescriptorSet0.fp_c3)._m0[5].z, _297);
    float _355 = fma(_347, (*spvDescriptorSet0.fp_c3)._m0[5].x, _345);
    float _357 = fma(_349, (*spvDescriptorSet0.fp_c3)._m0[5].w, _303);
    float _359 = _351 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _361 = _353 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _363 = _355 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _365 = _357 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    out.m_34.x = _363;
    out.m_34.y = _359;
    out.m_34.z = _361;
    out.m_34.w = _365;
    return out;
}

