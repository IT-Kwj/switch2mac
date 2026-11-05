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
    texture2d<float> fp_t_tcb_A [[id(2)]];
    sampler fp_t_tcb_ASmplr [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_36 [[color(0)]];
    float4 m_38 [[color(1)]];
    float4 m_40 [[color(2)]];
    float4 m_42 [[color(3)]];
    float4 m_44 [[color(4)]];
    float4 m_46 [[color(5)]];
};

struct main0_in
{
    float4 m_33 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_33.y;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = 1.0 / _53;
    float _69 = _67 * _59;
    float _71 = _67 * _65;
    float2 _279 = float2(_69, _71);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_279, float2(0.0), isnan(_279))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_279, float2(0.0), isnan(_279))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _79 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _85 = _81 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _87 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].x, _83);
    float _89 = -_77;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c4)._m0[1].x, _83);
    float _93 = -_85;
    float _95 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].y, _93);
    float _97 = -_81;
    float _99 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _101 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[1].z, _91);
    float _103 = -_77;
    float _105 = -_85;
    float _107 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[1].y, _105);
    float _109 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[1].z, _95);
    float _111 = fma(_99, -0.5, 0.5);
    float _113 = fma(_101, -0.5, 0.5);
    float _115 = -_79;
    float _117 = fma(_115, (*spvDescriptorSet0.fp_c4)._m0[1].z, _107);
    float _119 = -_85;
    float _121 = _83 + _119;
    float _123 = _83 + _85;
    float _125 = fma(_109, -0.5, 0.5);
    float _127 = fma(_117, -0.5, 0.5);
    float _129 = -_77;
    float _131 = fma(_129, (*spvDescriptorSet0.fp_c4)._m0[1].z, _121);
    float _133 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].z, _123);
    float _135 = abs(_111);
    float _137 = log2(_135);
    float _139 = fma(_131, -0.5, 0.5);
    float _141 = fma(_133, -0.5, 0.5);
    float _143 = abs(_113);
    float _145 = log2(_143);
    float _147 = abs(_125);
    float _149 = log2(_147);
    float _151 = _137 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _153 = abs(_127);
    float _155 = log2(_153);
    float _157 = _145 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _159 = abs(_139);
    float _161 = log2(_159);
    float _163 = _149 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _165 = abs(_141);
    float _167 = log2(_165);
    float _169 = _155 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _171 = _161 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _173 = exp2(_151);
    float _175 = _167 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _177 = exp2(_157);
    float _179 = exp2(_163);
    float _181 = exp2(_169);
    float _183 = exp2(_171);
    float _185 = exp2(_175);
    float2 _456 = float2(_173, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_456, float2(0.0), isnan(_456))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_456, float2(0.0), isnan(_456))).x;
    float2 _465 = float2(_177, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_465, float2(0.0), isnan(_465))).x;
    float2 _474 = float2(_179, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_474, float2(0.0), isnan(_474))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_474, float2(0.0), isnan(_474))).x;
    float2 _483 = float2(_181, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_483, float2(0.0), isnan(_483))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_483, float2(0.0), isnan(_483))).x;
    float2 _492 = float2(_183, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_492, float2(0.0), isnan(_492))).x;
    float2 _501 = float2(_185, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_501, float2(0.0), isnan(_501))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_501, float2(0.0), isnan(_501))).x;
    float _199 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _201 = _199 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _203 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _205 = _203 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _211 = fma(_187, _201, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _213 = fma(_201, _189, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _215 = fma(_201, _191, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _217 = fma(_201, _193, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _219 = fma(_187, _205, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _221 = fma(_205, _189, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _223 = fma(_205, _191, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _225 = fma(_201, _195, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _227 = fma(_205, _193, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _229 = fma(_205, _195, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _231 = fma(_187, _209, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _233 = fma(_209, _189, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _235 = fma(_209, _191, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _237 = fma(_209, _193, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _239 = fma(_209, _195, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _241 = fma(_201, _197, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _243 = fma(_205, _197, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _245 = fma(_209, _197, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    out.m_36.x = _211;
    out.m_36.y = _219;
    out.m_36.z = _231;
    out.m_36.w = _111;
    out.m_38.x = _213;
    out.m_38.y = _221;
    out.m_38.z = _233;
    out.m_38.w = _113;
    out.m_40.x = _215;
    out.m_40.y = _223;
    out.m_40.z = _235;
    out.m_40.w = _125;
    out.m_42.x = _217;
    out.m_42.y = _227;
    out.m_42.z = _237;
    out.m_42.w = _127;
    out.m_44.x = _225;
    out.m_44.y = _229;
    out.m_44.z = _239;
    out.m_44.w = _139;
    out.m_46.x = _241;
    out.m_46.y = _243;
    out.m_46.z = _245;
    out.m_46.w = _141;
    return out;
}

