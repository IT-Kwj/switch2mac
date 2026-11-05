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
    float2 _231 = float2(_69, _71);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_231, float2(0.0), isnan(_231))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_231, float2(0.0), isnan(_231))).xyz;
    float _77 = _75.x;
    float _79 = _75.y;
    float _81 = _75.z;
    float _83 = _79 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _85 = _81 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _87 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].x, _83);
    float _89 = -_77;
    float _91 = fma(_89, (*spvDescriptorSet0.fp_c4)._m0[1].x, _83);
    float _93 = -_85;
    float _95 = _83 + _93;
    float _97 = _83 + _85;
    float _99 = -_85;
    float _101 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].y, _99);
    float _103 = -_81;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _107 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[1].z, _91);
    float _109 = -_77;
    float _111 = -_85;
    float _113 = fma(_109, (*spvDescriptorSet0.fp_c4)._m0[1].y, _111);
    float _115 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[1].z, _101);
    float _117 = -_77;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[1].z, _95);
    float _121 = -_79;
    float _123 = fma(_121, (*spvDescriptorSet0.fp_c4)._m0[1].z, _113);
    float _125 = fma(_105, -0.5, 0.5);
    float _127 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].z, _97);
    float _129 = fma(_107, -0.5, 0.5);
    float _131 = fma(_115, -0.5, 0.5);
    float _133 = fma(_123, -0.5, 0.5);
    float _135 = fma(_119, -0.5, 0.5);
    float2 _346 = float2(_125, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_346, float2(0.0), isnan(_346))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_346, float2(0.0), isnan(_346))).x;
    float2 _355 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_355, float2(0.0), isnan(_355))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_355, float2(0.0), isnan(_355))).x;
    float2 _364 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364))).x;
    float2 _373 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_373, float2(0.0), isnan(_373))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_373, float2(0.0), isnan(_373))).x;
    float2 _382 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_382, float2(0.0), isnan(_382))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_382, float2(0.0), isnan(_382))).x;
    float _147 = fma(_127, -0.5, 0.5);
    float2 _393 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_393, float2(0.0), isnan(_393))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_393, float2(0.0), isnan(_393))).x;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _163 = fma(_137, _153, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _165 = fma(_153, _139, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _167 = fma(_153, _141, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _169 = fma(_153, _143, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _171 = fma(_153, _145, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _173 = fma(_137, _157, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _175 = fma(_157, _139, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _177 = fma(_157, _141, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _179 = fma(_157, _143, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _181 = fma(_153, _149, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _183 = fma(_157, _145, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _185 = fma(_157, _149, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _187 = fma(_137, _161, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _189 = fma(_161, _139, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _191 = fma(_161, _141, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _193 = fma(_161, _143, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _195 = fma(_161, _145, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _197 = fma(_161, _149, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    out.m_36.x = _163;
    out.m_36.y = _173;
    out.m_36.z = _187;
    out.m_36.w = _125;
    out.m_38.x = _165;
    out.m_38.y = _175;
    out.m_38.z = _189;
    out.m_38.w = _129;
    out.m_40.x = _167;
    out.m_40.y = _177;
    out.m_40.z = _191;
    out.m_40.w = _131;
    out.m_42.x = _169;
    out.m_42.y = _179;
    out.m_42.z = _193;
    out.m_42.w = _133;
    out.m_44.x = _171;
    out.m_44.y = _183;
    out.m_44.z = _195;
    out.m_44.w = _135;
    out.m_46.x = _181;
    out.m_46.y = _185;
    out.m_46.z = _197;
    out.m_46.w = _147;
    return out;
}

