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
    constant _16* fp_c5 [[id(0)]];
    constant _16* fp_c4 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    sampler fp_t_tcb_8Smplr_w [[id(4)]];
    constant dm_border_t* dm_border [[id(5)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
    float4 m_36 [[color(1)]];
    float4 m_38 [[color(2)]];
    float4 m_40 [[color(3)]];
    float4 m_42 [[color(4)]];
    float4 m_44 [[color(5)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _51 = gl_FragCoord.w;
    float _53 = in.m_31.x;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_31.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = 1.0 / _51;
    float _67 = _65 * _57;
    float _69 = _65 * _63;
    float2 _291 = float2(_67, _69);
    float3 _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_291, float2(0.0), isnan(_291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_291, float2(0.0), isnan(_291))).xyz;
    float _75 = _73.x;
    float _77 = _73.y;
    float _79 = _73.z;
    float _81 = (*spvDescriptorSet0.fp_c5)._m0[0].x * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _83 = fma(_81, 0.75, 7.4999996286351233720779418945312e-05);
    float _85 = _81 + 9.9999997473787516355514526367188e-05;
    float _87 = _81 + (-0.99989998340606689453125);
    float _89 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _91 = _89 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _93 = -_83;
    float _95 = _93 + 1.0;
    float _97 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _99 = _97 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _101 = _85 * _95;
    float _103 = _77 * (*spvDescriptorSet0.fp_c4)._m0[1].y;
    float _105 = _79 * (*spvDescriptorSet0.fp_c4)._m0[1].x;
    float _107 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].x, _103);
    float _109 = -_75;
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c4)._m0[1].x, _103);
    float _113 = -_105;
    float _115 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].y, _113);
    float _117 = -_75;
    float _119 = -_105;
    float _121 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[1].y, _119);
    float _123 = -_79;
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c4)._m0[1].z, _107);
    float _127 = fma(_125, -0.5, 0.5);
    float _129 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[1].z, _111);
    float _131 = _127 * _127;
    float _133 = fma(_129, -0.5, 0.5);
    float _135 = fma(_131, _87, 1.0);
    float _137 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].z, _115);
    float _139 = _133 * _133;
    float _141 = _135 * _135;
    float _143 = fma(_137, -0.5, 0.5);
    float _145 = fma(_87, _139, 1.0);
    float _147 = -_77;
    float _149 = fma(_147, (*spvDescriptorSet0.fp_c4)._m0[1].z, _121);
    float _151 = -_105;
    float _153 = _103 + _151;
    float _155 = _103 + _105;
    float _157 = _145 * _145;
    float _159 = 1.0 / _141;
    float _161 = -_75;
    float _163 = fma(_161, (*spvDescriptorSet0.fp_c4)._m0[1].z, _153);
    float _165 = fma(_149, -0.5, 0.5);
    float _167 = _143 * _143;
    float _169 = fma(_163, -0.5, 0.5);
    float _171 = _165 * _165;
    float _173 = fma(_87, _167, 1.0);
    float _175 = 1.0 / _157;
    float _177 = fma(_75, (*spvDescriptorSet0.fp_c4)._m0[1].z, _155);
    float _179 = _169 * _169;
    float _181 = fma(_87, _171, 1.0);
    float _183 = _173 * _173;
    float _185 = fma(_177, -0.5, 0.5);
    float _187 = fma(_87, _179, 1.0);
    float _189 = _181 * _181;
    float _191 = 1.0 / _183;
    float _193 = _185 * _185;
    float _195 = _187 * _187;
    float _197 = fma(_87, _193, 1.0);
    float _199 = 1.0 / _189;
    float _201 = _197 * _197;
    float _203 = _159 * _101;
    float _205 = _175 * _101;
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _211 = fma(_203, _91, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _213 = 1.0 / _195;
    float _215 = _191 * _101;
    float _217 = fma(_209, _215, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _219 = fma(_91, _215, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _221 = fma(_99, _215, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _223 = 1.0 / _201;
    float _225 = _199 * _101;
    float _227 = fma(_209, _205, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _229 = fma(_209, _225, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _231 = fma(_91, _225, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _233 = fma(_99, _225, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _235 = _213 * _101;
    float _237 = fma(_203, _209, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _239 = fma(_91, _205, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _241 = fma(_203, _99, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _243 = fma(_209, _235, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _245 = fma(_99, _205, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _247 = _223 * _101;
    float _249 = fma(_209, _247, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _251 = fma(_91, _235, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _253 = fma(_99, _235, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _255 = fma(_91, _247, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _257 = fma(_99, _247, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    out.m_34.x = _237;
    out.m_34.y = _211;
    out.m_34.z = _241;
    out.m_34.w = _127;
    out.m_36.x = _227;
    out.m_36.y = _239;
    out.m_36.z = _245;
    out.m_36.w = _133;
    out.m_38.x = _217;
    out.m_38.y = _219;
    out.m_38.z = _221;
    out.m_38.w = _143;
    out.m_40.x = _229;
    out.m_40.y = _231;
    out.m_40.z = _233;
    out.m_40.w = _165;
    out.m_42.x = _243;
    out.m_42.y = _251;
    out.m_42.z = _253;
    out.m_42.w = _169;
    out.m_44.x = _249;
    out.m_44.y = _255;
    out.m_44.z = _257;
    out.m_44.w = _185;
    return out;
}

