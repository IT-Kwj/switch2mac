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
    uint _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _16* fp_c4 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture3d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_CSmplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_ESmplr_w [[id(13)]];
    constant dm_border_t* dm_border [[id(14)]];
};

struct main0_out
{
    float4 m_43 [[color(0)]];
};

struct main0_in
{
    float4 m_40 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _50 = gl_FragCoord.w;
    float _52 = in.m_40.x;
    float _54 = gl_FragCoord.w;
    float _56 = _52 * _54;
    float _58 = in.m_40.y;
    float _60 = gl_FragCoord.w;
    float _62 = _58 * _60;
    float _64 = 1.0 / _50;
    float _66 = _64 * _56;
    float _68 = _64 * _62;
    float2 _461 = float2(_66, _68);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_461, float2(0.0), isnan(_461))).x;
    float _72 = fma(_66, (*spvDescriptorSet0.fp_c4)._m0[1].x, -0.5);
    float _74 = fma(_68, (*spvDescriptorSet0.fp_c4)._m0[1].y, -0.5);
    float _76 = floor(_72);
    float _78 = floor(_74);
    float _80 = -_76;
    float _82 = _72 + _80;
    float _84 = _76 + 1.5;
    float _86 = -_82;
    float _88 = _86 + 1.0;
    float _90 = -_82;
    float _92 = _90 + 2.0;
    float _94 = _88 * _88;
    float _96 = -_78;
    float _98 = _74 + _96;
    float _100 = _92 * _92;
    float _102 = _88 * _94;
    float _104 = -_98;
    float _106 = _104 + 2.0;
    float _108 = -_98;
    float _110 = _108 + 1.0;
    float _112 = _92 * _100;
    float _114 = -_98;
    float _116 = _114 + 3.0;
    float _118 = _106 * _106;
    float _120 = _110 * _110;
    float _122 = fma(_102, -4.0, _112);
    float _124 = -_102;
    float _126 = _124 + 6.0;
    float _128 = _106 * _118;
    float _130 = _110 * _120;
    float _132 = _116 * _116;
    float _134 = -_122;
    float _136 = _134 + _126;
    float _138 = _128 * 4.0;
    float _140 = -_82;
    float _142 = _140 + 3.0;
    float _144 = fma(_130, -4.0, _128);
    float _146 = -_138;
    float _148 = fma(_116, _132, _146);
    float _150 = _136 * 0.16666667163372039794921875;
    float _152 = _142 * _142;
    float _154 = _112 * 4.0;
    float _156 = _102 + _122;
    float _158 = -_130;
    float _160 = _158 + 6.0;
    float _162 = fma(_130, 6.0, _148);
    float _164 = -_154;
    float _166 = fma(_142, _152, _164);
    float _168 = _130 + _144;
    float _170 = _156 * 0.16666667163372039794921875;
    float _172 = fma(_68, -2.0, 1.0);
    float _174 = 1.0 / _150;
    float _176 = fma(_102, 6.0, _166);
    float _178 = _168 * 0.16666667163372039794921875;
    float _180 = fma(_66, 2.0, -1.0);
    float _182 = _172 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _184 = _172 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _186 = -_176;
    float _188 = _186 + _136;
    float _190 = _76 + (-0.5);
    float _192 = 1.0 / _170;
    float _194 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[2].x, _182);
    float _196 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[3].x, _184);
    float _198 = _188 * 0.16666667163372039794921875;
    float _200 = _122 * 0.16666667163372039794921875;
    float _202 = -_144;
    float _204 = _202 + _160;
    float _206 = _144 * 0.16666667163372039794921875;
    float _208 = _78 + 1.5;
    float _210 = fma(_198, _174, _84);
    float _212 = _78 + (-0.5);
    float _214 = _204 * 0.16666667163372039794921875;
    float _216 = -_162;
    float _218 = _216 + _204;
    float _220 = fma(_200, _192, _190);
    float _222 = 1.0 / _214;
    float _224 = _218 * 0.16666667163372039794921875;
    float _226 = fma(_224, _222, _208);
    float _228 = fma(_70, 2.0, -1.0);
    float _230 = 1.0 / _178;
    float _232 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[3].z, _196);
    float _234 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[2].z, _194);
    float _236 = _232 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _238 = _234 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _240 = 1.0 / _236;
    float _242 = fma(_206, _230, _212);
    float _244 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _246 = _238 * _240;
    float _248 = _246 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _250 = _220 * _244;
    float _252 = _210 * _244;
    float _254 = (*spvDescriptorSet0.fp_c4)._m0[1].z + (-1.0);
    float _256 = 1.0 / (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _258 = -_248;
    float _260 = fma(_258, _254, 1.0);
    float _262 = log2(_260);
    float _264 = _242 * _256;
    float _266 = _226 * _256;
    float _268 = _262 * 0.693147182464599609375;
    float2 _755 = float2(_66, _68);
    float4 _271 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_755, float2(0.0), isnan(_755))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_755, float2(0.0), isnan(_755))).xyzw;
    float _273 = _271.x;
    float _275 = _271.y;
    float _277 = _271.z;
    float _279 = _271.w;
    float _281 = _268 * (*spvDescriptorSet0.fp_c4)._m0[1].w;
    float3 _776 = float3(_250, _264, _281);
    float4 _283 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_776, float3(0.0), isnan(_776))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_776, float3(0.0), isnan(_776))).xyzw;
    float _285 = _283.x;
    float _287 = _283.y;
    float _289 = _283.z;
    float _291 = _283.w;
    float3 _795 = float3(_252, _264, _281);
    float4 _293 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_795, float3(0.0), isnan(_795))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_795, float3(0.0), isnan(_795))).xyzw;
    float _295 = _293.x;
    float _297 = _293.y;
    float _299 = _293.z;
    float _301 = _293.w;
    float3 _812 = float3(_250, _266, _281);
    float4 _303 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_812, float3(0.0), isnan(_812))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_812, float3(0.0), isnan(_812))).xyzw;
    float _305 = _303.x;
    float _307 = _303.y;
    float _309 = _303.z;
    float _311 = _303.w;
    float3 _829 = float3(_252, _266, _281);
    float4 _313 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_829, float3(0.0), isnan(_829))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_829, float3(0.0), isnan(_829))).xyzw;
    float _315 = _313.x;
    float _317 = _313.y;
    float _319 = _313.z;
    float _321 = _313.w;
    float2 _845 = float2(_66, _68);
    float3 _325 = dm_bs(spvDescriptorSet0.fp_t_tcb_E.sample(spvDescriptorSet0.fp_t_tcb_ESmplr, select(_845, float2(0.0), isnan(_845))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_E, spvDescriptorSet0.fp_t_tcb_ESmplr_w, select(_845, float2(0.0), isnan(_845))).xyz;
    float _327 = _325.x;
    float _329 = _325.y;
    float _331 = _325.z;
    float _333 = _279 + (-1.0);
    float _335 = fma(_333, (*spvDescriptorSet0.fp_c3)._m0[4].x, 1.0);
    float _337 = -_295;
    float _339 = _285 + _337;
    float _341 = -_301;
    float _343 = _291 + _341;
    float _345 = -_315;
    float _347 = _305 + _345;
    float _349 = -_297;
    float _351 = _287 + _349;
    float _353 = -_317;
    float _355 = _307 + _353;
    float _357 = -_299;
    float _359 = _289 + _357;
    float _361 = fma(_170, _343, _301);
    float _363 = -_319;
    float _365 = _309 + _363;
    float _367 = fma(_170, _339, _295);
    float _369 = -_321;
    float _371 = _311 + _369;
    float _373 = fma(_170, _347, _315);
    float _375 = fma(_170, _351, _297);
    float _377 = fma(_170, _355, _317);
    float _379 = fma(_170, _359, _299);
    float _381 = fma(_170, _365, _319);
    float _383 = fma(_170, _371, _321);
    float _385 = -_373;
    float _387 = _385 + _367;
    float _389 = -_377;
    float _391 = _389 + _375;
    float _393 = -_381;
    float _395 = _393 + _379;
    float _397 = -_383;
    float _399 = _397 + _361;
    float _401 = fma(_178, _387, _373);
    float _403 = fma(_178, _391, _377);
    float _405 = fma(_178, _395, _381);
    float _407 = fma(_178, _399, _383);
    float _409 = _327 + _401;
    float _411 = _273 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _413 = _329 + _403;
    float _415 = _275 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _417 = _331 + _405;
    float _419 = _277 * (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _421 = fma(_335, _409, _411);
    float _423 = fma(_335, _413, _415);
    float _425 = _335 * _407;
    float _427 = fma(_335, _417, _419);
    out.m_43.x = _421;
    out.m_43.y = _423;
    out.m_43.z = _427;
    out.m_43.w = _425;
    return out;
}

