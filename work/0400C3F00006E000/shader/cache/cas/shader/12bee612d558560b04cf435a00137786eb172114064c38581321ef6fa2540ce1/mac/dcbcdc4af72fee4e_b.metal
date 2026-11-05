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
    float2 _339 = float2(_69, _71);
    float3 _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_339, float2(0.0), isnan(_339))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_339, float2(0.0), isnan(_339))).xyz;
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
    float _97 = -_77;
    float _99 = -_85;
    float _101 = fma(_97, (*spvDescriptorSet0.fp_c4)._m0[1].y, _99);
    float _103 = -_81;
    float _105 = fma(_103, (*spvDescriptorSet0.fp_c4)._m0[1].z, _87);
    float _107 = -_85;
    float _109 = _83 + _107;
    float _111 = fma(_81, (*spvDescriptorSet0.fp_c4)._m0[1].z, _91);
    float _113 = _83 + _85;
    float _115 = fma(_79, (*spvDescriptorSet0.fp_c4)._m0[1].z, _95);
    float _117 = -_79;
    float _119 = fma(_117, (*spvDescriptorSet0.fp_c4)._m0[1].z, _101);
    float _121 = fma(_105, -0.5, 0.5);
    float _123 = -_77;
    float _125 = fma(_123, (*spvDescriptorSet0.fp_c4)._m0[1].z, _109);
    float _127 = fma(_111, -0.5, 0.5);
    float _129 = fma(_77, (*spvDescriptorSet0.fp_c4)._m0[1].z, _113);
    float _131 = fma(_115, -0.5, 0.5);
    float _133 = fma(_119, -0.5, 0.5);
    float _135 = abs(_121);
    float _137 = log2(_135);
    float _139 = fma(_125, -0.5, 0.5);
    float _141 = fma(_129, -0.5, 0.5);
    float _143 = abs(_127);
    float _145 = log2(_143);
    float _147 = abs(_131);
    float _149 = log2(_147);
    float _151 = _137 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _153 = abs(_133);
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
    float2 _516 = float2(_173, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _187 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_516, float2(0.0), isnan(_516))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_516, float2(0.0), isnan(_516))).x;
    float2 _525 = float2(_177, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _189 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_525, float2(0.0), isnan(_525))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_525, float2(0.0), isnan(_525))).x;
    float2 _534 = float2(_179, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _191 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_534, float2(0.0), isnan(_534))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_534, float2(0.0), isnan(_534))).x;
    float2 _543 = float2(_181, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _193 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_543, float2(0.0), isnan(_543))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_543, float2(0.0), isnan(_543))).x;
    float2 _552 = float2(_183, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _195 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_552, float2(0.0), isnan(_552))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_552, float2(0.0), isnan(_552))).x;
    float2 _561 = float2(_185, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _197 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_561, float2(0.0), isnan(_561))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_561, float2(0.0), isnan(_561))).x;
    float _199 = 0.0 + _121;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = 0.0 + _127;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _209 = _207 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _211 = 0.0 + _131;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _217 = _215 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _219 = 0.0 + _133;
    float _221 = precise::clamp(_219, 0.0, 1.0);
    float _223 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _225 = _223 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _227 = 0.0 + _139;
    float _229 = precise::clamp(_227, 0.0, 1.0);
    float _231 = 0.0 + _141;
    float _233 = precise::clamp(_231, 0.0, 1.0);
    float _235 = fma(_187, _209, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _237 = precise::clamp(_235, 0.0, 1.0);
    float _239 = fma(_209, _189, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _241 = precise::clamp(_239, 0.0, 1.0);
    float _243 = fma(_209, _191, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = fma(_209, _193, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _249 = precise::clamp(_247, 0.0, 1.0);
    float _251 = fma(_187, _217, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _253 = precise::clamp(_251, 0.0, 1.0);
    float _255 = fma(_217, _189, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = fma(_217, _191, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _261 = precise::clamp(_259, 0.0, 1.0);
    float _263 = fma(_209, _195, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = fma(_217, _193, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_217, _195, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = fma(_187, _225, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = fma(_225, _189, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = fma(_225, _191, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_225, _193, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_225, _195, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_209, _197, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_217, _197, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = fma(_225, _197, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    out.m_36.x = _237;
    out.m_36.y = _253;
    out.m_36.z = _277;
    out.m_36.w = _201;
    out.m_38.x = _241;
    out.m_38.y = _257;
    out.m_38.z = _281;
    out.m_38.w = _205;
    out.m_40.x = _245;
    out.m_40.y = _261;
    out.m_40.z = _285;
    out.m_40.w = _213;
    out.m_42.x = _249;
    out.m_42.y = _269;
    out.m_42.z = _289;
    out.m_42.w = _221;
    out.m_44.x = _265;
    out.m_44.y = _273;
    out.m_44.z = _293;
    out.m_44.w = _229;
    out.m_46.x = _297;
    out.m_46.y = _301;
    out.m_46.z = _305;
    out.m_46.w = _233;
    return out;
}

