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
    sampler fp_t_tcb_8Smplr_w [[id(3)]];
    constant dm_border_t* dm_border [[id(4)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
    float4 m_42 [[color(2)]];
    float4 m_44 [[color(3)]];
    float4 m_46 [[color(4)]];
    float4 m_48 [[color(5)]];
};

struct main0_in
{
    float4 m_29 [[user(locn0)]];
    float4 m_31 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_35 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_29.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_29.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _447 = float2(_71, _73);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_447, float2(0.0), isnan(_447))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = in.m_31.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_31.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_33.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_33.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_31.z;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_33.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_33.z;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_31.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_35.x;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_35.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_35.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_35.w;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = _69 * _89;
    float _159 = _69 * _95;
    float _161 = _69 * _101;
    float _163 = _69 * _107;
    float _165 = _69 * _113;
    float _167 = _69 * _119;
    float _169 = _69 * _125;
    float _171 = _69 * _131;
    float _173 = _69 * _137;
    float _175 = _69 * _143;
    float _177 = _69 * _149;
    float _179 = _69 * _155;
    float _181 = _173 * 0.2820999920368194580078125;
    float _183 = -_159;
    float _185 = _83 * _183;
    float _187 = _81 * _157;
    float _189 = -_163;
    float _191 = _83 * _189;
    float _193 = -_179;
    float _195 = _83 * _193;
    float _197 = fma(_79, _157, _185);
    float _199 = -_79;
    float _201 = fma(_199, _157, _185);
    float _203 = fma(_79, _159, _187);
    float _205 = -_79;
    float _207 = fma(_205, _159, _187);
    float _209 = _187 + _185;
    float _211 = fma(_83, _159, _187);
    float _213 = _81 * _167;
    float _215 = _81 * _175;
    float _217 = fma(_79, _167, _191);
    float _219 = -_79;
    float _221 = fma(_219, _167, _191);
    float _223 = fma(_79, _163, _213);
    float _225 = -_79;
    float _227 = fma(_225, _163, _213);
    float _229 = _213 + _191;
    float _231 = fma(_83, _163, _213);
    float _233 = fma(_79, _175, _195);
    float _235 = -_79;
    float _237 = fma(_235, _175, _195);
    float _239 = _215 + _195;
    float _241 = fma(_79, _179, _215);
    float _243 = -_79;
    float _245 = fma(_243, _179, _215);
    float _247 = fma(_83, _179, _215);
    float _249 = -_79;
    float _251 = fma(_249, _165, _209);
    float _253 = fma(_81, _169, _217);
    float _255 = -_83;
    float _257 = fma(_255, _169, _223);
    float _259 = fma(_83, _169, _227);
    float _261 = -_81;
    float _263 = fma(_261, _169, _221);
    float _265 = -_79;
    float _267 = fma(_265, _169, _229);
    float _269 = fma(_79, _169, _231);
    float _271 = fma(_81, _165, _197);
    float _273 = -_83;
    float _275 = fma(_273, _165, _203);
    float _277 = fma(_83, _165, _207);
    float _279 = -_81;
    float _281 = fma(_279, _165, _201);
    float _283 = fma(_81, _177, _233);
    float _285 = -_81;
    float _287 = fma(_285, _177, _237);
    float _289 = fma(_79, _165, _211);
    float _291 = -_83;
    float _293 = fma(_291, _177, _241);
    float _295 = fma(_83, _177, _245);
    float _297 = _171 * 0.2820999920368194580078125;
    float _299 = -_79;
    float _301 = fma(_299, _177, _239);
    float _303 = fma(_79, _177, _247);
    float _305 = _161 * 0.2820999920368194580078125;
    float _307 = fma(_275, 0.3257299959659576416015625, _297);
    float _309 = fma(_277, 0.3257299959659576416015625, _297);
    float _311 = fma(_271, 0.3257299959659576416015625, _297);
    float _313 = fma(_281, 0.3257299959659576416015625, _297);
    float _315 = fma(_251, 0.3257299959659576416015625, _297);
    float _317 = fma(_289, 0.3257299959659576416015625, _297);
    float _319 = fma(_257, 0.3257299959659576416015625, _305);
    float _321 = fma(_259, 0.3257299959659576416015625, _305);
    float _323 = fma(_253, 0.3257299959659576416015625, _305);
    float _325 = fma(_263, 0.3257299959659576416015625, _305);
    float _327 = fma(_267, 0.3257299959659576416015625, _305);
    float _329 = fma(_269, 0.3257299959659576416015625, _305);
    float _331 = fma(_283, 0.3257299959659576416015625, _181);
    float _333 = fma(_287, 0.3257299959659576416015625, _181);
    float _335 = fma(_301, 0.3257299959659576416015625, _181);
    float _337 = fma(_293, 0.3257299959659576416015625, _181);
    float _339 = fma(_295, 0.3257299959659576416015625, _181);
    float _341 = fma(_303, 0.3257299959659576416015625, _181);
    float _343 = precise::max(0.0, _307);
    float _345 = precise::max(0.0, _309);
    float _347 = precise::max(0.0, _311);
    float _349 = _343 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _351 = precise::max(0.0, _313);
    float _353 = _345 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _355 = precise::max(0.0, _315);
    float _357 = _347 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _359 = precise::max(0.0, _317);
    float _361 = _351 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _363 = precise::max(0.0, _319);
    float _365 = _355 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _367 = precise::max(0.0, _321);
    float _369 = _359 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _371 = precise::max(0.0, _323);
    float _373 = _363 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _375 = precise::max(0.0, _325);
    float _377 = _367 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _379 = precise::max(0.0, _327);
    float _381 = _371 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _383 = precise::max(0.0, _329);
    float _385 = _375 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _387 = precise::max(0.0, _331);
    float _389 = _379 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _391 = precise::max(0.0, _333);
    float _393 = _383 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _395 = precise::max(0.0, _335);
    float _397 = _387 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _399 = precise::max(0.0, _337);
    float _401 = _391 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _403 = precise::max(0.0, _339);
    float _405 = _395 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _407 = precise::max(0.0, _341);
    float _409 = _399 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _411 = _403 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    float _413 = _407 * (*spvDescriptorSet0.fp_c3)._m0[9].x;
    out.m_38.x = _349;
    out.m_38.y = _373;
    out.m_38.z = _409;
    out.m_38.w = 1.0;
    out.m_40.x = _353;
    out.m_40.y = _377;
    out.m_40.z = _411;
    out.m_40.w = 1.0;
    out.m_42.x = _357;
    out.m_42.y = _381;
    out.m_42.z = _397;
    out.m_42.w = 1.0;
    out.m_44.x = _361;
    out.m_44.y = _385;
    out.m_44.z = _401;
    out.m_44.w = 1.0;
    out.m_46.x = _365;
    out.m_46.y = _389;
    out.m_46.z = _405;
    out.m_46.w = 1.0;
    out.m_48.x = _369;
    out.m_48.y = _393;
    out.m_48.z = _413;
    out.m_48.w = 1.0;
    return out;
}

