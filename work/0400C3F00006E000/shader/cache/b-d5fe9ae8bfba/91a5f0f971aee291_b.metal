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
    float _79 = _73 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _81 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[1].x, _77);
    float _83 = fma(_71, (*spvDescriptorSet0.fp_c4)._m0[2].x, _79);
    float _85 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _87 = -_75;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _91 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _93 = -_75;
    float _95 = fma(_93, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _97 = fma(_85, -0.5, 0.5);
    float _99 = fma(_89, -0.5, 0.5);
    float _101 = fma(_91, -0.5, 0.5);
    float _103 = fma(_95, -0.5, 0.5);
    float2 _402 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_402, float2(0.0), isnan(_402))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_402, float2(0.0), isnan(_402))).x;
    float2 _411 = float2(_99, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_411, float2(0.0), isnan(_411))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_411, float2(0.0), isnan(_411))).x;
    float2 _421 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_421, float2(0.0), isnan(_421))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_421, float2(0.0), isnan(_421))).x;
    float2 _430 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_430, float2(0.0), isnan(_430))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_430, float2(0.0), isnan(_430))).x;
    float _113 = abs(_75);
    float _115 = -_113;
    float _117 = _115 + 1.0;
    float _119 = 0.0 + _97;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = 0.0 + _99;
    float _125 = precise::clamp(_123, 0.0, 1.0);
    float _127 = _117 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = _101 + _121;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = abs(_129);
    float _137 = log2(_135);
    float _139 = _103 + _125;
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _145 = _143 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _147 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _149 = _147 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _155 = _137 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _157 = abs(_105);
    float _159 = log2(_157);
    float _161 = abs(_109);
    float _163 = log2(_161);
    float _165 = abs(_107);
    float _167 = log2(_165);
    float _169 = _159 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _171 = abs(_111);
    float _173 = log2(_171);
    float _175 = _163 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _177 = _167 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _179 = exp2(_169);
    float _181 = _173 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _183 = exp2(_175);
    float _185 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _187 = _185 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _189 = exp2(_177);
    float _191 = fma(_179, _153, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = fma(_179, _149, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _197 = precise::clamp(_195, 0.0, 1.0);
    float _199 = exp2(_181);
    float _201 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _203 = _201 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _205 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _207 = _205 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _209 = fma(_179, _145, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = fma(_183, _203, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _215 = exp2(_155);
    float _217 = fma(_183, _187, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _219 = fma(_153, _189, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = fma(_145, _189, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _225 = precise::clamp(_223, 0.0, 1.0);
    float _227 = fma(_149, _189, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = fma(_183, _207, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _233 = _217 + _193;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = _213 + _211;
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = fma(_187, _199, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _243 = fma(_203, _199, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _245 = fma(_207, _199, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _247 = _231 + _197;
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = _241 + _221;
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = _243 + _225;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = _245 + _229;
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].w, _133);
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].w, _141);
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].x, _235);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].y, _239);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].z, _249);
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].x, _253);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].y, _257);
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_215, (*spvDescriptorSet0.fp_c4)._m0[0].z, _261);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    out.m_38.x = _273;
    out.m_38.y = _277;
    out.m_38.z = _281;
    out.m_38.w = _265;
    out.m_40.x = _285;
    out.m_40.y = _289;
    out.m_40.z = _293;
    out.m_40.w = _269;
    return out;
}

