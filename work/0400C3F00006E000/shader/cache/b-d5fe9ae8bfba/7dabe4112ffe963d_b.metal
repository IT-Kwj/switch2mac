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
    constant _16* fp_c5 [[id(1)]];
    constant _16* fp_c3 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_38 [[color(0)]];
    float4 m_40 [[color(1)]];
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _47 = gl_FragCoord.w;
    float _49 = in.m_35.x;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = in.m_35.y;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = 1.0 / _47;
    float _63 = _61 * _53;
    float _65 = _61 * _59;
    float2 _423 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_423, float2(0.0), isnan(_423))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = _73 * (*spvDescriptorSet0.fp_c4)._m0[4].y;
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _89 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _91 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[4].x, _83);
    float _93 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _95 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _97 = -_75;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[1].z, _85);
    float _101 = -_75;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[2].z, _87);
    float _105 = fma(_93, -0.5, 0.5);
    float _107 = fma(_95, -0.5, 0.5);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float2 _517 = float2(_105, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _113 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_517, float2(0.0), isnan(_517))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_517, float2(0.0), isnan(_517))).x;
    float _115 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float2 _531 = float2(_109, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _117 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_531, float2(0.0), isnan(_531))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_531, float2(0.0), isnan(_531))).x;
    float2 _541 = float2(_107, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _119 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_541, float2(0.0), isnan(_541))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_541, float2(0.0), isnan(_541))).x;
    float2 _550 = float2(_111, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _121 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_550, float2(0.0), isnan(_550))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_550, float2(0.0), isnan(_550))).x;
    float _123 = fma(_115, -0.5, 0.5);
    float _125 = -_75;
    float _127 = fma(_125, (*spvDescriptorSet0.fp_c4)._m0[3].z, _89);
    float _129 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float _131 = -_75;
    float _133 = fma(_131, (*spvDescriptorSet0.fp_c4)._m0[4].z, _91);
    float2 _581 = float2(_123, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _135 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_581, float2(0.0), isnan(_581))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_581, float2(0.0), isnan(_581))).x;
    float _137 = fma(_127, -0.5, 0.5);
    float _139 = fma(_129, -0.5, 0.5);
    float _141 = fma(_133, -0.5, 0.5);
    float2 _596 = float2(_137, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_596, float2(0.0), isnan(_596))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_596, float2(0.0), isnan(_596))).x;
    float2 _606 = float2(_139, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_606, float2(0.0), isnan(_606))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_606, float2(0.0), isnan(_606))).x;
    float2 _615 = float2(_141, (*spvDescriptorSet0.fp_c5)._m0[11].x);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_615, float2(0.0), isnan(_615))).x;
    float _149 = _105 + _107;
    float _151 = _109 + _111;
    float _153 = _149 + _123;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _159 = _151 + _137;
    float _161 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _163 = _161 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _165 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _167 = _165 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _173 = _139 + _153;
    float _175 = _141 + _159;
    float _177 = abs(_113);
    float _179 = log2(_177);
    float _181 = abs(_117);
    float _183 = log2(_181);
    float _185 = abs(_119);
    float _187 = log2(_185);
    float _189 = _179 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _191 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _193 = _191 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _195 = _183 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _197 = exp2(_189);
    float _199 = _187 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _201 = abs(_121);
    float _203 = log2(_201);
    float _205 = exp2(_195);
    float _207 = fma(_197, _193, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _209 = fma(_197, _163, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _211 = exp2(_199);
    float _213 = fma(_197, _157, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _215 = _203 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _217 = abs(_135);
    float _219 = log2(_217);
    float _221 = fma(_157, _205, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _223 = fma(_193, _205, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _225 = fma(_163, _205, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _227 = exp2(_215);
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _233 = fma(_211, _171, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _235 = fma(_211, _231, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _237 = _209 + _233;
    float _239 = abs(_143);
    float _241 = log2(_239);
    float _243 = _219 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _245 = _213 + _235;
    float _247 = fma(_211, _167, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _249 = _207 + _247;
    float _251 = abs(_145);
    float _253 = log2(_251);
    float _255 = fma(_231, _227, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _257 = fma(_167, _227, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _259 = fma(_171, _227, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _261 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _263 = _261 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _265 = _223 + _257;
    float _267 = _225 + _259;
    float _269 = exp2(_243);
    float _271 = abs(_75);
    float _273 = -_271;
    float _275 = _273 + 1.0;
    float _277 = _241 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _279 = _221 + _255;
    float _281 = _275 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = abs(_147);
    float _287 = log2(_285);
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _293 = _253 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _295 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _297 = _295 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _299 = abs(_283);
    float _301 = log2(_299);
    float _303 = fma(_269, _297, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _305 = _245 + _303;
    float _307 = exp2(_277);
    float _309 = _287 * (*spvDescriptorSet0.fp_c5)._m0[3].x;
    float _311 = exp2(_293);
    float _313 = fma(_269, _291, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _315 = fma(_269, _263, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _317 = _249 + _313;
    float _319 = _301 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _321 = _237 + _315;
    float _323 = exp2(_309);
    float _325 = fma(_297, _307, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _327 = fma(_291, _307, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _329 = _279 + _325;
    float _331 = -(*spvDescriptorSet0.fp_c5)._m0[22].x;
    float _333 = _331 + (*spvDescriptorSet0.fp_c5)._m0[23].x;
    float _335 = exp2(_319);
    float _337 = fma(_263, _307, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _339 = -(*spvDescriptorSet0.fp_c5)._m0[22].y;
    float _341 = _339 + (*spvDescriptorSet0.fp_c5)._m0[23].y;
    float _343 = _265 + _327;
    float _345 = -(*spvDescriptorSet0.fp_c5)._m0[22].z;
    float _347 = _345 + (*spvDescriptorSet0.fp_c5)._m0[23].z;
    float _349 = _267 + _337;
    float _351 = fma(_311, _341, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _353 = fma(_311, _333, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _355 = fma(_311, _347, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _357 = fma(_333, _323, (*spvDescriptorSet0.fp_c5)._m0[22].x);
    float _359 = fma(_341, _323, (*spvDescriptorSet0.fp_c5)._m0[22].y);
    float _361 = fma(_347, _323, (*spvDescriptorSet0.fp_c5)._m0[22].z);
    float _363 = _355 + _321;
    float _365 = _353 + _305;
    float _367 = _351 + _317;
    float _369 = _357 + _329;
    float _371 = _359 + _343;
    float _373 = _361 + _349;
    float _375 = fma(_335, (*spvDescriptorSet0.fp_c4)._m0[0].w, _173);
    float _377 = fma(_335, (*spvDescriptorSet0.fp_c4)._m0[0].w, _175);
    float _379 = fma(_335, (*spvDescriptorSet0.fp_c4)._m0[0].x, _365);
    float _381 = fma(_335, (*spvDescriptorSet0.fp_c4)._m0[0].y, _367);
    float _383 = fma(_335, (*spvDescriptorSet0.fp_c4)._m0[0].z, _363);
    float _385 = fma(_335, (*spvDescriptorSet0.fp_c4)._m0[0].x, _369);
    float _387 = fma(_335, (*spvDescriptorSet0.fp_c4)._m0[0].y, _371);
    float _389 = fma(_335, (*spvDescriptorSet0.fp_c4)._m0[0].z, _373);
    out.m_38.x = _379;
    out.m_38.y = _381;
    out.m_38.z = _383;
    out.m_38.w = _375;
    out.m_40.x = _385;
    out.m_40.y = _387;
    out.m_40.z = _389;
    out.m_40.w = _377;
    return out;
}

