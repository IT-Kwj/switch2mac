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
    float2 _454 = float2(_127, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_454, float2(0.0), isnan(_454))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_454, float2(0.0), isnan(_454))).x;
    float2 _463 = float2(_129, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _139 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_463, float2(0.0), isnan(_463))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_463, float2(0.0), isnan(_463))).x;
    float2 _472 = float2(_131, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _141 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_472, float2(0.0), isnan(_472))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_472, float2(0.0), isnan(_472))).x;
    float2 _481 = float2(_133, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _143 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_481, float2(0.0), isnan(_481))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_481, float2(0.0), isnan(_481))).x;
    float2 _490 = float2(_135, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_490, float2(0.0), isnan(_490))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_490, float2(0.0), isnan(_490))).x;
    float _147 = fma(_125, -0.5, 0.5);
    float2 _501 = float2(_147, (*spvDescriptorSet0.fp_c5)._m0[8].x);
    float _149 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_501, float2(0.0), isnan(_501))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_501, float2(0.0), isnan(_501))).x;
    float _151 = -(*spvDescriptorSet0.fp_c5)._m0[16].x;
    float _153 = _151 + (*spvDescriptorSet0.fp_c5)._m0[17].x;
    float _155 = -(*spvDescriptorSet0.fp_c5)._m0[16].y;
    float _157 = _155 + (*spvDescriptorSet0.fp_c5)._m0[17].y;
    float _159 = -(*spvDescriptorSet0.fp_c5)._m0[16].z;
    float _161 = _159 + (*spvDescriptorSet0.fp_c5)._m0[17].z;
    float _163 = 0.0 + _127;
    float _165 = precise::clamp(_163, 0.0, 1.0);
    float _167 = 0.0 + _129;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = 0.0 + _131;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = 0.0 + _133;
    float _177 = precise::clamp(_175, 0.0, 1.0);
    float _179 = 0.0 + _135;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = 0.0 + _147;
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = abs(_137);
    float _189 = log2(_187);
    float _191 = abs(_139);
    float _193 = log2(_191);
    float _195 = abs(_141);
    float _197 = log2(_195);
    float _199 = _189 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _201 = abs(_143);
    float _203 = log2(_201);
    float _205 = _193 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _207 = abs(_145);
    float _209 = log2(_207);
    float _211 = _197 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _213 = abs(_149);
    float _215 = log2(_213);
    float _217 = _203 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _219 = _209 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _221 = exp2(_199);
    float _223 = _215 * (*spvDescriptorSet0.fp_c5)._m0[0].x;
    float _225 = exp2(_205);
    float _227 = exp2(_211);
    float _229 = fma(_221, _153, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_221, _157, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = fma(_221, _161, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _239 = precise::clamp(_237, 0.0, 1.0);
    float _241 = exp2(_217);
    float _243 = fma(_157, _225, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = exp2(_219);
    float _249 = fma(_153, _227, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _251 = precise::clamp(_249, 0.0, 1.0);
    float _253 = fma(_157, _227, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = fma(_161, _227, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _259 = precise::clamp(_257, 0.0, 1.0);
    float _261 = exp2(_223);
    float _263 = fma(_153, _225, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _265 = precise::clamp(_263, 0.0, 1.0);
    float _267 = fma(_153, _241, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _269 = precise::clamp(_267, 0.0, 1.0);
    float _271 = fma(_161, _225, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _273 = precise::clamp(_271, 0.0, 1.0);
    float _275 = fma(_153, _247, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _277 = precise::clamp(_275, 0.0, 1.0);
    float _279 = fma(_157, _241, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _281 = precise::clamp(_279, 0.0, 1.0);
    float _283 = fma(_157, _247, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _285 = precise::clamp(_283, 0.0, 1.0);
    float _287 = fma(_161, _241, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _289 = precise::clamp(_287, 0.0, 1.0);
    float _291 = fma(_161, _247, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _293 = precise::clamp(_291, 0.0, 1.0);
    float _295 = fma(_153, _261, (*spvDescriptorSet0.fp_c5)._m0[16].x);
    float _297 = precise::clamp(_295, 0.0, 1.0);
    float _299 = fma(_157, _261, (*spvDescriptorSet0.fp_c5)._m0[16].y);
    float _301 = precise::clamp(_299, 0.0, 1.0);
    float _303 = fma(_161, _261, (*spvDescriptorSet0.fp_c5)._m0[16].z);
    float _305 = precise::clamp(_303, 0.0, 1.0);
    out.m_36.x = _231;
    out.m_36.y = _235;
    out.m_36.z = _239;
    out.m_36.w = _165;
    out.m_38.x = _265;
    out.m_38.y = _245;
    out.m_38.z = _273;
    out.m_38.w = _169;
    out.m_40.x = _251;
    out.m_40.y = _255;
    out.m_40.z = _259;
    out.m_40.w = _173;
    out.m_42.x = _269;
    out.m_42.y = _281;
    out.m_42.z = _289;
    out.m_42.w = _177;
    out.m_44.x = _277;
    out.m_44.y = _285;
    out.m_44.z = _293;
    out.m_44.w = _181;
    out.m_46.x = _297;
    out.m_46.y = _301;
    out.m_46.z = _305;
    out.m_46.w = _185;
    return out;
}

