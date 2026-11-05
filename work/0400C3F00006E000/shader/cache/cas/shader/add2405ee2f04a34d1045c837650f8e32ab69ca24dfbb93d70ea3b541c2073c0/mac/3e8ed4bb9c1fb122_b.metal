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
    float2 _327 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_327, float2(0.0), isnan(_327))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_327, float2(0.0), isnan(_327))).xyz;
    float _71 = _69.x;
    float _73 = _69.y;
    float _75 = _69.z;
    float _77 = _73 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _79 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _81 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _83 = -_75;
    float _85 = fma(_83, (*spvDescriptorSet0.fp_c4)._m0[1].z, _79);
    float _87 = fma(_81, -0.5, 0.5);
    float _89 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _91 = fma(_85, -0.5, 0.5);
    float _93 = abs(_87);
    float _95 = log2(_93);
    float _97 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _89);
    float _99 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _97);
    float _101 = -_75;
    float _103 = fma(_101, (*spvDescriptorSet0.fp_c4)._m0[2].z, _97);
    float _105 = abs(_91);
    float _107 = log2(_105);
    float _109 = fma(_99, -0.5, 0.5);
    float _111 = fma(_103, -0.5, 0.5);
    float _113 = abs(_109);
    float _115 = log2(_113);
    float _117 = _95 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _119 = abs(_111);
    float _121 = log2(_119);
    float _123 = _107 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _125 = _115 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _127 = exp2(_117);
    float _129 = _121 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _131 = exp2(_123);
    float _133 = exp2(_125);
    float _135 = exp2(_129);
    float2 _442 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_442, float2(0.0), isnan(_442))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_442, float2(0.0), isnan(_442))).x;
    float2 _451 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_451, float2(0.0), isnan(_451))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_451, float2(0.0), isnan(_451))).x;
    float2 _461 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_461, float2(0.0), isnan(_461))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_461, float2(0.0), isnan(_461))).x;
    float2 _470 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_470, float2(0.0), isnan(_470))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_470, float2(0.0), isnan(_470))).x;
    float _145 = abs(_75);
    float _147 = -_145;
    float _149 = _147 + 1.0;
    float _151 = 0.0 + _87;
    float _153 = precise::clamp(_151, 0.0, 1.0);
    float _155 = 0.0 + _91;
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = _149 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _109 + _153;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _169 = _167 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _171 = _111 + _157;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = abs(_161);
    float _177 = log2(_175);
    float _179 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _181 = _179 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _183 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _185 = _183 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _187 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _189 = _187 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _191 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _193 = _191 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _195 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _197 = _195 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _199 = _177 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _201 = exp2(_199);
    float _203 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[0].w, _165);
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[0].w, _173);
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = fma(_137, _181, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = fma(_137, _169, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = fma(_137, _189, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = fma(_181, _139, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = fma(_169, _139, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_189, _139, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = fma(_141, _185, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _237 = fma(_141, _193, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _239 = fma(_141, _197, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _241 = _235 + _213;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _237 + _217;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = fma(_185, _143, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _251 = fma(_193, _143, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _253 = fma(_197, _143, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _255 = _239 + _221;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = _249 + _225;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = _251 + _229;
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = _253 + _233;
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[0].x, _243);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[0].y, _247);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[0].z, _257);
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[0].x, _261);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[0].y, _265);
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_201, (*spvDescriptorSet0.fp_c4)._m0[0].z, _269);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    out.m_38.x = _273;
    out.m_38.y = _277;
    out.m_38.z = _281;
    out.m_38.w = _205;
    out.m_40.x = _285;
    out.m_40.y = _289;
    out.m_40.z = _293;
    out.m_40.w = _209;
    return out;
}

