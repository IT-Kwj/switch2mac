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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    texture2d_array<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0)]];
    float4 m_46 [[user(locn1)]];
    float4 m_38 [[user(locn2)]];
    float4 m_36 [[user(locn3), center_no_perspective]];
    float4 m_26 [[user(locn4), center_no_perspective]];
    float4 m_30 [[user(locn5)]];
    float4 m_40 [[user(locn6)]];
    float4 m_32 [[user(locn7)]];
    float4 m_34 [[user(locn8)]];
    float4 m_42 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = in.m_26.x;
    float _58 = in.m_26.y;
    float2 _391 = float2(_56, _58);
    float _60 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_391, float2(0.0), isnan(_391))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_391, float2(0.0), isnan(_391))).x;
    float _62 = gl_FragCoord.w;
    float _64 = in.m_30.x;
    float _66 = gl_FragCoord.w;
    float _68 = _64 * _66;
    float _70 = in.m_30.y;
    float _72 = gl_FragCoord.w;
    float _74 = _70 * _72;
    float _76 = in.m_32.y;
    float _78 = gl_FragCoord.w;
    float _80 = _76 * _78;
    float _82 = in.m_32.x;
    float _84 = gl_FragCoord.w;
    float _86 = _82 * _84;
    float _88 = in.m_34.y;
    float _90 = gl_FragCoord.w;
    float _92 = _88 * _90;
    float _94 = in.m_36.y;
    float _96 = in.m_34.x;
    float _98 = gl_FragCoord.w;
    float _100 = _96 * _98;
    float _102 = in.m_36.x;
    float _104 = in.m_34.z;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = in.m_34.w;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_38.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_30.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_32.z;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_32.w;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = 1.0 / _62;
    float _142 = in.m_30.w;
    float _144 = gl_FragCoord.w;
    float _146 = _142 * _144;
    float _148 = _140 * _68;
    float _150 = _140 * _74;
    float _152 = _140 * _80;
    float _154 = _140 * _86;
    float _156 = _140 * _92;
    float _158 = _94 * _150;
    float _160 = _94 * _152;
    float _162 = _140 * _100;
    float _164 = _94 * _156;
    float _166 = fma(_102, _148, _158);
    float _168 = fma(_102, _154, _160);
    float _170 = _140 * _138;
    float _172 = fma(_102, _162, _164);
    float _174 = _140 * _108;
    float _176 = _140 * _146;
    float _178 = fma(_60, 2.0, -1.0);
    float _180 = _140 * _114;
    float _182 = fma(_178, _174, _172);
    float _184 = _140 * _126;
    float _186 = _140 * _132;
    float _188 = _180 + _182;
    float _190 = _140 * _120;
    float _192 = fma(_178, _186, _168);
    float _194 = fma(_178, _184, _166);
    float _196 = 1.0 / _188;
    float _198 = _170 + _192;
    float _200 = _176 + _194;
    float _202 = rint(_190);
    float _204 = precise::max(_202, 0.0);
    uint _207 = uint(_204);
    uint _209 = clamp(_207, 0u, 65535u);
    float _211 = fma(_198, _196, 0.5);
    float _213 = -_200;
    float _215 = fma(_213, _196, 0.5);
    float3 _615 = float3(_215, _211, float(int(_209)));
    float3 _619 = select(_615, float3(0.0), isnan(_615));
    float _217 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _619.xy, uint(rint(_619.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _619.xy, uint(rint(_619.z))).x;
    float _219 = in.m_40.y;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_40.x;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_40.z;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = in.m_40.w;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_42.z;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_42.w;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_44.x;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    bool _263 = _215 <= 1.0;
    bool _265 = isnan(_215);
    bool _267 = _263 || _265;
    bool _269 = isnan(1.0);
    bool _271 = _267 || _269;
    float _273 = _140 * _223;
    float _275 = _94 * _273;
    float _277 = _140 * _229;
    float _279 = in.m_46.x;
    float _281 = gl_FragCoord.w;
    float _283 = _279 * _281;
    float _285 = fma(_102, _277, _275);
    float _287 = _140 * _235;
    float _289 = _140 * _241;
    float _291 = _140 * _253;
    bool _293 = _215 >= 0.0;
    bool _295 = isnan(_215);
    bool _297 = _293 || _295;
    bool _299 = isnan(0.0);
    bool _301 = _297 || _299;
    bool _303 = _301 && _271;
    float _305 = float(_303);
    float _307 = fma(_178, _287, _285);
    bool _309 = _211 <= 1.0;
    bool _311 = isnan(_211);
    bool _313 = _309 || _311;
    bool _315 = isnan(1.0);
    bool _317 = _313 || _315;
    float _319 = in.m_42.x;
    float _321 = gl_FragCoord.w;
    float _323 = _319 * _321;
    float _325 = _289 + _307;
    float _327 = -_325;
    float _329 = fma(_327, _196, 0.5);
    float _331 = -_325;
    float _333 = fma(_331, _196, -0.5);
    float _335 = _140 * _247;
    float _337 = _291 * _333;
    float _339 = _329 * _335;
    float _341 = precise::min(_339, _337);
    float _343 = _140 * _283;
    float _345 = _341 * _343;
    float _347 = _140 * _259;
    float _349 = _140 * _323;
    float _351 = precise::min(_345, _347);
    float _353 = _349 * _351;
    bool _355 = _211 >= 0.0;
    bool _357 = isnan(_211);
    bool _359 = _355 || _357;
    bool _361 = isnan(0.0);
    bool _363 = _359 || _361;
    bool _365 = _363 && _317;
    float _367 = float(_365);
    float _369 = _353 * _305;
    float _371 = _369 * _367;
    float _373 = -_217;
    float _375 = _373 + 1.0;
    float _377 = -_371;
    float _379 = fma(_377, _375, 1.0);
    out.m_49.x = _379;
    out.m_49.y = _379;
    out.m_49.z = _379;
    out.m_49.w = _379;
    return out;
}

