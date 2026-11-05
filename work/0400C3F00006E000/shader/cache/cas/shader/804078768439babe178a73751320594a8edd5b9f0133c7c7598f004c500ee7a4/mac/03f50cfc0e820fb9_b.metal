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
    float2 _417 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_417, float2(0.0), isnan(_417))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_417, float2(0.0), isnan(_417))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = _73 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _85 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _87 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[3].x, _81);
    float _89 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _91 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _93 = -_75;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[1].z, _83);
    float _97 = -_75;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[2].z, _85);
    float _101 = fma(_89, -0.5, 0.5);
    float _103 = fma(_91, -0.5, 0.5);
    float _105 = fma(_95, -0.5, 0.5);
    float _107 = fma(_99, -0.5, 0.5);
    float _109 = abs(_101);
    float _111 = log2(_109);
    float _113 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _115 = -_75;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[3].z, _87);
    float _119 = fma(_113, -0.5, 0.5);
    float _121 = fma(_117, -0.5, 0.5);
    float _123 = abs(_103);
    float _125 = log2(_123);
    float _127 = abs(_105);
    float _129 = log2(_127);
    float _131 = _111 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _133 = abs(_107);
    float _135 = log2(_133);
    float _137 = _125 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _139 = abs(_119);
    float _141 = log2(_139);
    float _143 = _129 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _145 = abs(_121);
    float _147 = log2(_145);
    float _149 = _135 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _151 = exp2(_131);
    float _153 = _141 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _155 = exp2(_143);
    float _157 = _147 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _159 = exp2(_137);
    float _161 = exp2(_149);
    float2 _573 = float2(_151, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _163 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_573, float2(0.0), isnan(_573))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_573, float2(0.0), isnan(_573))).x;
    float2 _582 = float2(_155, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _165 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_582, float2(0.0), isnan(_582))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_582, float2(0.0), isnan(_582))).x;
    float _167 = exp2(_153);
    float2 _594 = float2(_159, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _169 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_594, float2(0.0), isnan(_594))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_594, float2(0.0), isnan(_594))).x;
    float _171 = exp2(_157);
    float2 _605 = float2(_161, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _173 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_605, float2(0.0), isnan(_605))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_605, float2(0.0), isnan(_605))).x;
    float2 _615 = float2(_167, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _175 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_615, float2(0.0), isnan(_615))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_615, float2(0.0), isnan(_615))).x;
    float2 _624 = float2(_171, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _177 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_624, float2(0.0), isnan(_624))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_624, float2(0.0), isnan(_624))).x;
    float _179 = abs(_75);
    float _181 = -_179;
    float _183 = _181 + 1.0;
    float _185 = 0.0 + _101;
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = 0.0 + _105;
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = _183 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _195 = precise::clamp(_193, 0.0, 1.0);
    float _197 = _187 + _103;
    float _199 = precise::clamp(_197, 0.0, 1.0);
    float _201 = _191 + _107;
    float _203 = precise::clamp(_201, 0.0, 1.0);
    float _205 = _119 + _199;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = abs(_195);
    float _211 = log2(_209);
    float _213 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _215 = _213 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _217 = _121 + _203;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _223 = _221 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _225 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _227 = _225 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _229 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _231 = _229 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _233 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _235 = _233 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _237 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _239 = _237 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _241 = fma(_163, _215, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = fma(_163, _223, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = fma(_163, _235, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = fma(_215, _165, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = fma(_223, _165, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = fma(_169, _227, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _263 = fma(_169, _231, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _265 = fma(_169, _239, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _267 = fma(_235, _165, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = _211 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _273 = _247 + _261;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = _251 + _265;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    float _281 = fma(_231, _173, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _283 = fma(_227, _173, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _285 = fma(_239, _173, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _287 = exp2(_271);
    float _289 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _291 = _289 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _293 = _255 + _281;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _299 = _297 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _301 = _243 + _263;
    float _303 = precise::clamp(_301, 0.0, 1.0);
    float _305 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _307 = _305 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _309 = fma(_175, _291, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _311 = fma(_175, _299, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _313 = _259 + _283;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    float _317 = fma(_175, _307, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _319 = fma(_299, _177, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _321 = _269 + _285;
    float _323 = precise::clamp(_321, 0.0, 1.0);
    float _325 = fma(_291, _177, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _327 = fma(_307, _177, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _329 = _317 + _279;
    float _331 = precise::clamp(_329, 0.0, 1.0);
    float _333 = _319 + _295;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = _311 + _303;
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = _309 + _275;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _325 + _315;
    float _347 = precise::clamp(_345, 0.0, 1.0);
    float _349 = _327 + _323;
    float _351 = precise::clamp(_349, 0.0, 1.0);
    float _353 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].w, _207);
    float _355 = precise::clamp(_353, 0.0, 1.0);
    float _357 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].w, _219);
    float _359 = precise::clamp(_357, 0.0, 1.0);
    float _361 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].x, _339);
    float _363 = precise::clamp(_361, 0.0, 1.0);
    float _365 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].y, _343);
    float _367 = precise::clamp(_365, 0.0, 1.0);
    float _369 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].z, _331);
    float _371 = precise::clamp(_369, 0.0, 1.0);
    float _373 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].x, _335);
    float _375 = precise::clamp(_373, 0.0, 1.0);
    float _377 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].y, _347);
    float _379 = precise::clamp(_377, 0.0, 1.0);
    float _381 = fma(_287, (*spvDescriptorSet0.fp_c4)._m0[0].z, _351);
    float _383 = precise::clamp(_381, 0.0, 1.0);
    out.m_38.x = _363;
    out.m_38.y = _367;
    out.m_38.z = _371;
    out.m_38.w = _355;
    out.m_40.x = _375;
    out.m_40.y = _379;
    out.m_40.z = _383;
    out.m_40.w = _359;
    return out;
}

