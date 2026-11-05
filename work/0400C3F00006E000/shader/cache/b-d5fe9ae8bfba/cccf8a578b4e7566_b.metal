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
    float _125 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].z, _97);
    float _127 = fma(_105, -0.5, 0.5);
    float _129 = fma(_107, -0.5, 0.5);
    float _131 = fma(_115, -0.5, 0.5);
    float _133 = fma(_123, -0.5, 0.5);
    float _135 = fma(_119, -0.5, 0.5);
    float _137 = fma(_125, -0.5, 0.5);
    float2 _396 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396))).x;
    float2 _405 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_405, float2(0.0), isnan(_405))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_405, float2(0.0), isnan(_405))).x;
    float2 _414 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_414, float2(0.0), isnan(_414))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_414, float2(0.0), isnan(_414))).x;
    float2 _423 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_423, float2(0.0), isnan(_423))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_423, float2(0.0), isnan(_423))).x;
    float2 _432 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _147 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_432, float2(0.0), isnan(_432))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_432, float2(0.0), isnan(_432))).x;
    float2 _441 = float2(_137, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_441, float2(0.0), isnan(_441))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_441, float2(0.0), isnan(_441))).x;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _163 = abs(_139);
    float _165 = log2(_163);
    float _167 = abs(_141);
    float _169 = log2(_167);
    float _171 = abs(_143);
    float _173 = log2(_171);
    float _175 = _165 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _177 = abs(_145);
    float _179 = log2(_177);
    float _181 = _169 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _183 = abs(_147);
    float _185 = log2(_183);
    float _187 = abs(_149);
    float _189 = log2(_187);
    float _191 = _173 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _193 = _179 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _195 = _185 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _197 = exp2(_175);
    float _199 = _189 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _201 = exp2(_181);
    float _203 = exp2(_191);
    float _205 = fma(_197, _153, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _207 = fma(_197, _157, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _209 = fma(_197, _161, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _211 = exp2(_193);
    float _213 = fma(_157, _201, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _215 = exp2(_195);
    float _217 = fma(_153, _203, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _219 = fma(_157, _203, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _221 = fma(_161, _203, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _223 = exp2(_199);
    float _225 = fma(_153, _201, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _227 = fma(_153, _211, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _229 = fma(_161, _201, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _231 = fma(_153, _215, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _233 = fma(_157, _211, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _235 = fma(_157, _215, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _237 = fma(_161, _211, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _239 = fma(_161, _215, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _241 = fma(_153, _223, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _243 = fma(_157, _223, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _245 = fma(_161, _223, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    out.m_36.x = _205;
    out.m_36.y = _207;
    out.m_36.z = _209;
    out.m_36.w = _127;
    out.m_38.x = _225;
    out.m_38.y = _213;
    out.m_38.z = _229;
    out.m_38.w = _129;
    out.m_40.x = _217;
    out.m_40.y = _219;
    out.m_40.z = _221;
    out.m_40.w = _131;
    out.m_42.x = _227;
    out.m_42.y = _233;
    out.m_42.z = _237;
    out.m_42.w = _133;
    out.m_44.x = _231;
    out.m_44.y = _235;
    out.m_44.z = _239;
    out.m_44.w = _135;
    out.m_46.x = _241;
    out.m_46.y = _243;
    out.m_46.z = _245;
    out.m_46.w = _137;
    return out;
}

