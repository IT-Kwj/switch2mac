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
    float2 _275 = float2(_63, _65);
    float3 _69 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_275, float2(0.0), isnan(_275))).xyz;
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
    float2 _350 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _105 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_350, float2(0.0), isnan(_350))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_350, float2(0.0), isnan(_350))).x;
    float2 _359 = float2(_99, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _107 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_359, float2(0.0), isnan(_359))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_359, float2(0.0), isnan(_359))).x;
    float2 _369 = float2(_101, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_369, float2(0.0), isnan(_369))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_369, float2(0.0), isnan(_369))).x;
    float2 _378 = float2(_103, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _111 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_378, float2(0.0), isnan(_378))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_378, float2(0.0), isnan(_378))).x;
    float _113 = abs(_75);
    float _115 = -_113;
    float _117 = _115 + 1.0;
    float _119 = _101 + _97;
    float _121 = _117 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _103 + _99;
    float _127 = abs(_123);
    float _129 = log2(_127);
    float _131 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _133 = _131 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _135 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _137 = _135 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _139 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _141 = _139 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _143 = _129 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _145 = abs(_105);
    float _147 = log2(_145);
    float _149 = abs(_109);
    float _151 = log2(_149);
    float _153 = abs(_107);
    float _155 = log2(_153);
    float _157 = _147 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _159 = abs(_111);
    float _161 = log2(_159);
    float _163 = _151 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _165 = _155 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _167 = exp2(_157);
    float _169 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _171 = _169 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _173 = _161 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _175 = exp2(_163);
    float _177 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _179 = _177 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _181 = exp2(_165);
    float _183 = fma(_167, _133, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _185 = fma(_167, _141, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _187 = exp2(_173);
    float _189 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _191 = _189 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _193 = fma(_167, _137, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _195 = fma(_175, _171, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _197 = _195 + _193;
    float _199 = exp2(_143);
    float _201 = fma(_175, _179, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _203 = fma(_133, _181, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _205 = fma(_137, _181, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _207 = fma(_141, _181, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _209 = fma(_175, _191, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _211 = _201 + _183;
    float _213 = fma(_179, _187, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _215 = fma(_171, _187, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _217 = fma(_191, _187, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _219 = _209 + _185;
    float _221 = _213 + _203;
    float _223 = _215 + _205;
    float _225 = _217 + _207;
    float _227 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].w, _119);
    float _229 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].w, _125);
    float _231 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].x, _211);
    float _233 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].y, _197);
    float _235 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].z, _219);
    float _237 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].x, _221);
    float _239 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].y, _223);
    float _241 = fma(_199, (*spvDescriptorSet0.fp_c4)._m0[0].z, _225);
    out.m_38.x = _231;
    out.m_38.y = _233;
    out.m_38.z = _235;
    out.m_38.w = _227;
    out.m_40.x = _237;
    out.m_40.y = _239;
    out.m_40.z = _241;
    out.m_40.w = _229;
    return out;
}

