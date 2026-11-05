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
};

struct main0_in
{
    float4 m_35 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _45 = gl_FragCoord.w;
    float _47 = in.m_35.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_35.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = 1.0 / _45;
    float _61 = _59 * _51;
    float _63 = _59 * _57;
    float2 _291 = float2(_61, _63);
    float3 _67 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_291, float2(0.0), isnan(_291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_291, float2(0.0), isnan(_291))).xyz;
    float _69 = _67.x;
    float _71 = _67.y;
    float _73 = _67.z;
    float _75 = _71 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _77 = _71 * (*spvDescriptorSet0.fp_c4)._m0[2].y;
    float _79 = _71 * (*spvDescriptorSet0.fp_c4)._m0[3].y;
    float _81 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[1].x, _75);
    float _83 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[2].x, _77);
    float _85 = fma(_69, (*spvDescriptorSet0.fp_c4)._m0[3].x, _79);
    float _87 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[1].z, _81);
    float _89 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[2].z, _83);
    float _91 = fma(_73, (*spvDescriptorSet0.fp_c4)._m0[3].z, _85);
    float _93 = fma(_87, -0.5, 0.5);
    float _95 = fma(_89, -0.5, 0.5);
    float _97 = fma(_91, -0.5, 0.5);
    float2 _364 = float2(_93, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _99 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).x;
    float2 _374 = float2(_95, (*spvDescriptorSet0.fp_c5)._m0[9].x);
    float _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_374, float2(0.0), isnan(_374))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_374, float2(0.0), isnan(_374))).x;
    float2 _384 = float2(_97, (*spvDescriptorSet0.fp_c5)._m0[10].x);
    float _103 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_384, float2(0.0), isnan(_384))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_384, float2(0.0), isnan(_384))).x;
    float _105 = abs(_73);
    float _107 = -_105;
    float _109 = _107 + 1.0;
    float _111 = 0.0 + _93;
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _109 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _113 + _95;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = -(*spvDescriptorSet0.fp_c5)._m0[18].z;
    float _125 = _123 + (*spvDescriptorSet0.fp_c5)._m0[19].z;
    float _127 = abs(_117);
    float _129 = log2(_127);
    float _131 = _97 + _121;
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _137 = _135 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _139 = -(*spvDescriptorSet0.fp_c5)._m0[18].y;
    float _141 = _139 + (*spvDescriptorSet0.fp_c5)._m0[19].y;
    float _143 = abs(_99);
    float _145 = log2(_143);
    float _147 = abs(_101);
    float _149 = log2(_147);
    float _151 = abs(_103);
    float _153 = log2(_151);
    float _155 = _145 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _157 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _159 = _157 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _161 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _163 = _161 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _165 = -(*spvDescriptorSet0.fp_c5)._m0[18].x;
    float _167 = _165 + (*spvDescriptorSet0.fp_c5)._m0[19].x;
    float _169 = _149 * (*spvDescriptorSet0.fp_c5)._m0[1].x;
    float _171 = exp2(_155);
    float _173 = _153 * (*spvDescriptorSet0.fp_c5)._m0[2].x;
    float _175 = exp2(_169);
    float _177 = exp2(_173);
    float _179 = fma(_171, _159, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _129 * (*spvDescriptorSet0.fp_c3)._m0[0].x;
    float _185 = fma(_171, _137, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _187 = precise::clamp(_185, 0.0, 1.0);
    float _189 = fma(_171, _163, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _191 = precise::clamp(_189, 0.0, 1.0);
    float _193 = fma(_175, _167, (*spvDescriptorSet0.fp_c5)._m0[18].x);
    float _195 = fma(_175, _141, (*spvDescriptorSet0.fp_c5)._m0[18].y);
    float _197 = exp2(_183);
    float _199 = _187 + _193;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _181 + _195;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[20].x;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[21].x;
    float _211 = -(*spvDescriptorSet0.fp_c5)._m0[20].y;
    float _213 = _211 + (*spvDescriptorSet0.fp_c5)._m0[21].y;
    float _215 = fma(_175, _125, (*spvDescriptorSet0.fp_c5)._m0[18].z);
    float _217 = -(*spvDescriptorSet0.fp_c5)._m0[20].z;
    float _219 = _217 + (*spvDescriptorSet0.fp_c5)._m0[21].z;
    float _221 = fma(_177, _209, (*spvDescriptorSet0.fp_c5)._m0[20].x);
    float _223 = fma(_177, _213, (*spvDescriptorSet0.fp_c5)._m0[20].y);
    float _225 = _191 + _215;
    float _227 = precise::clamp(_225, 0.0, 1.0);
    float _229 = fma(_177, _219, (*spvDescriptorSet0.fp_c5)._m0[20].z);
    float _231 = _221 + _201;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = _223 + _205;
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = _229 + _227;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_197, (*spvDescriptorSet0.fp_c4)._m0[0].w, _133);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = fma(_197, (*spvDescriptorSet0.fp_c4)._m0[0].x, _233);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = fma(_197, (*spvDescriptorSet0.fp_c4)._m0[0].y, _237);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = fma(_197, (*spvDescriptorSet0.fp_c4)._m0[0].z, _241);
    float _257 = precise::clamp(_255, 0.0, 1.0);
    out.m_38.x = _249;
    out.m_38.y = _253;
    out.m_38.z = _257;
    out.m_38.w = _245;
    return out;
}

