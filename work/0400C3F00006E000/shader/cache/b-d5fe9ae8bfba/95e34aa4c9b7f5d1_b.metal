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
    texture2d<float> fp_t_tcb_A [[id(1)]];
    sampler fp_t_tcb_ASmplr [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_ASmplr_w [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
    float4 m_33 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_31.y;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_33.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_33.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _45;
    float _73 = _71 * _51;
    float _75 = _71 * _57;
    float _77 = _71 * _63;
    float _79 = _71 * _69;
    float _81 = _73 + (-0.189999997615814208984375);
    float _83 = _77 + (-0.065693430602550506591796875);
    float2 _433 = float2(_75, _81);
    float _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_433, float2(0.0), isnan(_433))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_433, float2(0.0), isnan(_433))).w;
    float2 _445 = float2(_79, _83);
    float _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_445, float2(0.0), isnan(_445))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_445, float2(0.0), isnan(_445))).w;
    float2 _453 = float2(_79, _77);
    float3 _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_453, float2(0.0), isnan(_453))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_453, float2(0.0), isnan(_453))).yzw;
    float _93 = _91.x;
    float _95 = _91.y;
    float _97 = _91.z;
    float _99 = in.m_35.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[6].y;
    float _107 = 1.0 + _105;
    float _109 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[7].y;
    float _111 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[7].x;
    float _113 = -(*spvDescriptorSet0.fp_c3)._m0[6].z;
    float _115 = 1.0 + _113;
    float _117 = fma(_79, _107, (*spvDescriptorSet0.fp_c3)._m0[6].y);
    float _119 = fma(_79, _109, 1.0);
    float _121 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[7].z;
    float _123 = -(*spvDescriptorSet0.fp_c3)._m0[6].w;
    float _125 = 1.0 + _123;
    float _127 = fma(_79, _111, 1.0);
    float _129 = -_117;
    float _131 = _129 + _119;
    float _133 = fma(_79, _115, (*spvDescriptorSet0.fp_c3)._m0[6].z);
    float _135 = fma(_79, _125, (*spvDescriptorSet0.fp_c3)._m0[6].w);
    float _137 = fma(_79, _121, 1.0);
    float _139 = -(*spvDescriptorSet0.fp_c3)._m0[27].x;
    float _141 = _139 + (*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _143 = -(*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _145 = _143 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _147 = -_133;
    float _149 = _147 + _137;
    float _151 = -(*spvDescriptorSet0.fp_c3)._m0[3].y;
    float _153 = _151 + (*spvDescriptorSet0.fp_c3)._m0[4].y;
    float _155 = fma(_77, _149, _133);
    float _157 = -(*spvDescriptorSet0.fp_c3)._m0[27].z;
    float _159 = _157 + (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _161 = fma(_77, _145, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _163 = _71 * _103;
    float _165 = -(*spvDescriptorSet0.fp_c3)._m0[6].x;
    float _167 = 1.0 + _165;
    float _169 = (-1.0) + (*spvDescriptorSet0.fp_c3)._m0[7].w;
    float _171 = -(*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _173 = _171 + (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _175 = fma(_77, _159, (*spvDescriptorSet0.fp_c3)._m0[27].z);
    float _177 = fma(_79, _167, (*spvDescriptorSet0.fp_c3)._m0[6].x);
    float _179 = fma(_79, _169, 1.0);
    float _181 = fma(_77, _131, _117);
    float _183 = -_177;
    float _185 = _183 + _127;
    float _187 = -_135;
    float _189 = _187 + _179;
    float _191 = fma(_77, _141, (*spvDescriptorSet0.fp_c3)._m0[27].x);
    float _193 = fma(_77, _173, (*spvDescriptorSet0.fp_c3)._m0[29].y);
    float _195 = fma(_77, _185, _177);
    float _197 = fma(_77, _189, _135);
    float _199 = -(*spvDescriptorSet0.fp_c3)._m0[29].x;
    float _201 = _199 + (*spvDescriptorSet0.fp_c3)._m0[30].x;
    float _203 = -(*spvDescriptorSet0.fp_c3)._m0[3].x;
    float _205 = _203 + (*spvDescriptorSet0.fp_c3)._m0[4].x;
    float _207 = -(*spvDescriptorSet0.fp_c3)._m0[3].z;
    float _209 = _207 + (*spvDescriptorSet0.fp_c3)._m0[4].z;
    float _211 = fma(_77, _201, (*spvDescriptorSet0.fp_c3)._m0[29].x);
    float _213 = fma(_77, _153, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _215 = -(*spvDescriptorSet0.fp_c3)._m0[29].z;
    float _217 = _215 + (*spvDescriptorSet0.fp_c3)._m0[30].z;
    float _219 = fma(_77, _205, (*spvDescriptorSet0.fp_c3)._m0[3].x);
    float _221 = fma(_77, _217, (*spvDescriptorSet0.fp_c3)._m0[29].z);
    float _223 = fma(_77, _209, (*spvDescriptorSet0.fp_c3)._m0[3].z);
    float _225 = _85 * (*spvDescriptorSet0.fp_c3)._m0[24].x;
    float _227 = _85 * (*spvDescriptorSet0.fp_c3)._m0[24].z;
    float _229 = _85 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _231 = _211 * _225;
    float _233 = _87 * (*spvDescriptorSet0.fp_c3)._m0[23].x;
    float _235 = _221 * _227;
    float _237 = _85 * 0.300000011920928955078125;
    float _239 = -_87;
    float _241 = _239 + 1.0;
    float _243 = _191 * _233;
    float _245 = _87 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _247 = abs(_95);
    float _249 = log2(_247);
    float _251 = _193 * _229;
    float _253 = _241 * _237;
    float _255 = _87 * (*spvDescriptorSet0.fp_c3)._m0[23].z;
    float _257 = _161 * _245;
    float _259 = fma(_237, _241, _87);
    float _261 = _251 * _253;
    float _263 = _175 * _255;
    float _265 = _231 * _253;
    float _267 = fma(_87, _257, _261);
    float _269 = _235 * _253;
    float _271 = _97 * (*spvDescriptorSet0.fp_c3)._m0[18].x;
    float _273 = -(*spvDescriptorSet0.fp_c3)._m0[1].x;
    float _275 = _273 + (*spvDescriptorSet0.fp_c3)._m0[2].x;
    float _277 = _249 * 2.2000000476837158203125;
    float _279 = fma(_87, _243, _265);
    float _281 = fma(_87, _263, _269);
    float _283 = -(*spvDescriptorSet0.fp_c3)._m0[1].y;
    float _285 = _283 + (*spvDescriptorSet0.fp_c3)._m0[2].y;
    float _287 = _197 * _271;
    float _289 = -(*spvDescriptorSet0.fp_c3)._m0[1].z;
    float _291 = _289 + (*spvDescriptorSet0.fp_c3)._m0[2].z;
    float _293 = fma(_97, _275, (*spvDescriptorSet0.fp_c3)._m0[1].x);
    float _295 = -_97;
    float _297 = _295 + 1.0;
    float _299 = exp2(_277);
    float _301 = fma(_97, _285, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _303 = fma(_97, _291, (*spvDescriptorSet0.fp_c3)._m0[1].z);
    float _305 = _293 * _219;
    float _307 = _279 * _297;
    float _309 = fma(_259, _297, _97);
    float _311 = _267 * _297;
    float _313 = _301 * _213;
    float _315 = _281 * _297;
    float _317 = _303 * _223;
    float _319 = fma(_97, _305, _307);
    float _321 = -_93;
    float _323 = _321 + 1.0;
    float _325 = fma(_97, _313, _311);
    float _327 = fma(_97, _317, _315);
    float _329 = _219 * (*spvDescriptorSet0.fp_c3)._m0[5].x;
    float _331 = _319 * _323;
    float _333 = fma(_309, _323, _93);
    float _335 = _325 * _323;
    float _337 = _327 * _323;
    float _339 = fma(_93, _329, _331);
    float _341 = _213 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
    float _343 = _299 * 1.5;
    float _345 = _223 * (*spvDescriptorSet0.fp_c3)._m0[5].z;
    float _347 = _333 + _287;
    float _349 = precise::clamp(_347, 0.0, 1.0);
    float _351 = fma(_93, _341, _335);
    float _353 = _155 * _343;
    float _355 = _287 * _343;
    float _357 = fma(_93, _345, _337);
    float _359 = _349 * _163;
    float _361 = precise::clamp(_359, 0.0, 1.0);
    float _363 = fma(_195, _355, _339);
    float _365 = precise::clamp(_363, 0.0, 1.0);
    float _367 = fma(_181, _355, _351);
    float _369 = precise::clamp(_367, 0.0, 1.0);
    float _371 = fma(_353, _287, _357);
    float _373 = precise::clamp(_371, 0.0, 1.0);
    out.m_38.x = _365;
    out.m_38.y = _369;
    out.m_38.z = _373;
    out.m_38.w = _361;
    return out;
}

