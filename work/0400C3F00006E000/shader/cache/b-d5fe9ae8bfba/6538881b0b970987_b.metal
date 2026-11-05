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
    texture2d_array<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_36 [[user(locn0)]];
    float4 m_42 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_34 [[user(locn4), center_no_perspective]];
    float4 m_38 [[user(locn6)]];
    float4 m_40 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _56 = gl_FragCoord.w;
    float _58 = in.m_34.x;
    float _60 = in.m_34.y;
    float _62 = in.m_36.x;
    float _64 = gl_FragCoord.w;
    float _66 = _62 * _64;
    float _68 = 1.0 / _56;
    float2 _250 = float2(_58, _60);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_250, float2(0.0), isnan(_250))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_250, float2(0.0), isnan(_250))).x;
    float _72 = _68 * _66;
    float _74 = rint(_72);
    float _76 = precise::max(_74, 0.0);
    uint _79 = uint(_76);
    uint _81 = clamp(_79, 0u, 65535u);
    float3 _279 = float3(as_type<float>(0x7fffffffu /* nan */), as_type<float>(0x7fffffffu /* nan */), float(int(_81)));
    float3 _283 = select(_279, float3(0.0), isnan(_279));
    float _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, _283.xy, uint(rint(_283.z))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, _283.xy, uint(rint(_283.z))).x;
    float _85 = in.m_38.y;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_40.y;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_42.y;
    float _99 = in.m_38.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_40.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_42.x;
    float _113 = in.m_40.z;
    float _115 = gl_FragCoord.w;
    float _117 = _113 * _115;
    float _119 = in.m_40.w;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_38.z;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_44.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_38.w;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _68 * _89;
    float _145 = _68 * _95;
    float _147 = _68 * _103;
    float _149 = _97 * _143;
    float _151 = _97 * _145;
    float _153 = in.m_44.x;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = _68 * _109;
    float _161 = in.m_46.x;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = in.m_46.y;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = fma(_111, _147, _149);
    float _175 = fma(_111, _159, _151);
    float _177 = _68 * _117;
    float _179 = _68 * _135;
    float _181 = _68 * _165;
    float _183 = fma(_70, 2.0, -1.0);
    float _185 = fma(_183, _177, _175);
    float _187 = _68 * _123;
    float _189 = _187 + _185;
    float _191 = _68 * _129;
    float _193 = 1.0 / _189;
    float _195 = fma(_183, _191, _173);
    float _197 = _68 * _141;
    float _199 = _197 + _195;
    float _201 = _68 * _157;
    float _203 = _68 * _171;
    float _205 = _199 * _193;
    float _207 = fma(_201, _205, _179);
    float _209 = fma(_83, _203, _181);
    float _211 = -_207;
    float _213 = _211 + _209;
    float _215 = fma(_213, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _217 = exp2(_215);
    float _219 = 0.0 + _217;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -_221;
    float _225 = _223 + 1.0;
    out.m_49.x = _225;
    out.m_49.y = _225;
    out.m_49.z = _225;
    out.m_49.w = _225;
    return out;
}

