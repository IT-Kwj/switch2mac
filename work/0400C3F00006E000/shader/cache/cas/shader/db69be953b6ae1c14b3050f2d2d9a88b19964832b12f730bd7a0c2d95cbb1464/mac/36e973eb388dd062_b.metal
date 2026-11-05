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
    constant _16* fp_c3 [[id(0)]];
    texture2d<float> fp_t_tcb_8 [[id(1)]];
    sampler fp_t_tcb_8Smplr [[id(2)]];
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_55 [[color(0)]];
};

struct main0_in
{
    float4 m_32 [[user(locn0), center_no_perspective]];
    float4 m_50 [[user(locn1)]];
    float4 m_52 [[user(locn2)]];
    float4 m_38 [[user(locn3)]];
    float4 m_44 [[user(locn4)]];
    float4 m_42 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_46 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
    float4 m_36 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _62 = in.m_32.x;
    float _64 = in.m_32.y;
    float2 _417 = float2(_62, _64);
    float _66 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_417, float2(0.0), isnan(_417))).x;
    float _68 = gl_FragCoord.w;
    float _70 = in.m_36.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_36.x;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_36.z;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_36.w;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_38.x;
    float _96 = gl_FragCoord.w;
    float _98 = _94 * _96;
    float _100 = in.m_38.y;
    float _102 = gl_FragCoord.w;
    float _104 = _100 * _102;
    float _106 = in.m_40.z;
    float _108 = gl_FragCoord.w;
    float _110 = _106 * _108;
    float _112 = in.m_40.x;
    float _114 = gl_FragCoord.w;
    float _116 = _112 * _114;
    float _118 = in.m_42.z;
    float _120 = gl_FragCoord.w;
    float _122 = _118 * _120;
    float _124 = in.m_42.x;
    float _126 = gl_FragCoord.w;
    float _128 = _124 * _126;
    float _130 = 1.0 / _68;
    float _132 = _130 * _74;
    float _134 = _130 * _80;
    float _136 = _132 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _138 = _132 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _140 = _132 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
    float _142 = _130 * _86;
    float _144 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[7].x, _136);
    float _146 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[6].x, _138);
    float _148 = fma(_134, (*spvDescriptorSet0.fp_c3)._m0[8].x, _140);
    float _150 = _130 * _92;
    float _152 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[6].z, _146);
    float _154 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[7].z, _144);
    float _156 = fma(_142, (*spvDescriptorSet0.fp_c3)._m0[8].z, _148);
    float _158 = in.m_38.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[6].w, _152);
    float _166 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[7].w, _154);
    float _168 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[8].w, _156);
    float _170 = in.m_44.x;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_46.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = 1.0 / _168;
    float _184 = _130 * _162;
    float _186 = _130 * _174;
    float _188 = _130 * _180;
    float _190 = rint(_186);
    float _192 = precise::max(_190, 0.0);
    uint _195 = uint(_192);
    uint _197 = clamp(_195, 0u, 65535u);
    float _199 = -_66;
    float _201 = fma(_199, (*spvDescriptorSet0.fp_c3)._m0[0].y, 1.0);
    float _203 = 1.0 / _201;
    float _205 = -(*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _207 = _203 * _205;
    float _209 = in.m_48.z;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = _207 * _182;
    float _217 = _166 * _215;
    float _219 = _164 * _215;
    float _221 = in.m_46.z;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = _217 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _229 = _217 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _231 = _217 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _233 = _130 * _98;
    float _235 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[2].x, _227);
    float _237 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[3].x, _229);
    float _239 = in.m_48.x;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = fma(_219, (*spvDescriptorSet0.fp_c3)._m0[4].x, _231);
    float _247 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[2].z, _235);
    float _249 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[3].z, _237);
    float _251 = _130 * _104;
    float _253 = fma(_207, (*spvDescriptorSet0.fp_c3)._m0[4].z, _245);
    float _255 = _247 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
    float _257 = _249 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
    float _259 = _130 * _110;
    float _261 = _130 * _122;
    float _263 = -_233;
    float _265 = _255 + _263;
    float _267 = -_251;
    float _269 = _257 + _267;
    float _271 = _130 * _116;
    float _273 = _253 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
    float _275 = _130 * _128;
    float _277 = _269 * _259;
    float _279 = _269 * _271;
    float _281 = -_184;
    float _283 = _273 + _281;
    float _285 = _130 * _213;
    float _287 = fma(_265, _261, _277);
    float _289 = fma(_265, _275, _279);
    float _291 = fma(_283, _188, _289);
    float _293 = _130 * _225;
    float _295 = fma(_283, _293, _287);
    float _297 = _130 * _243;
    float _299 = _285 + _295;
    float _301 = _297 + _291;
    float _303 = _299 + 0.5;
    float _305 = -_301;
    float _307 = _305 + 0.5;
    float3 _801 = float3(_307, _303, float(int(_197)));
    float3 _805 = select(_801, float3(0.0), isnan(_801));
    float _309 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _805.xy, uint(rint(_805.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _805.xy, uint(rint(_805.z))).x;
    float _311 = in.m_40.y;
    float _313 = gl_FragCoord.w;
    float _315 = _311 * _313;
    float _317 = in.m_42.y;
    float _319 = gl_FragCoord.w;
    float _321 = _317 * _319;
    float _323 = in.m_46.y;
    float _325 = gl_FragCoord.w;
    float _327 = _323 * _325;
    float _329 = in.m_48.y;
    float _331 = gl_FragCoord.w;
    float _333 = _329 * _331;
    float _335 = in.m_50.x;
    float _337 = gl_FragCoord.w;
    float _339 = _335 * _337;
    float _341 = in.m_50.z;
    float _343 = gl_FragCoord.w;
    float _345 = _341 * _343;
    float _347 = in.m_50.y;
    float _349 = gl_FragCoord.w;
    float _351 = _347 * _349;
    float _353 = in.m_52.w;
    float _355 = gl_FragCoord.w;
    float _357 = _353 * _355;
    float _359 = _130 * _315;
    float _361 = _269 * _359;
    float _363 = _130 * _321;
    float _365 = fma(_265, _363, _361);
    float _367 = _130 * _327;
    float _369 = _130 * _339;
    float _371 = fma(_283, _367, _365);
    float _373 = _130 * _333;
    float _375 = _130 * _345;
    float _377 = _373 + _371;
    bool _381 = _377 > _369;
    float _383 = -_377;
    float _385 = _383 + 0.5;
    float _387 = -_377;
    float _389 = _387 + (-0.5);
    float _391 = _375 * _385;
    float _393 = _130 * _351;
    float _395 = _130 * _357;
    float _397 = _391;
    if (!_381)
    {
        float _399 = _393 * _389;
        _397 = _399;
    }
    float _401 = _397;
    float _403 = _309 * _395;
    float _405 = _401 * _403;
    out.m_55.x = 0.0;
    out.m_55.y = 0.0;
    out.m_55.z = 0.0;
    out.m_55.w = _405;
    return out;
}

