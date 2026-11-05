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
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    sampler fp_t_tcb_ASmplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_34 [[color(0)]];
};

struct main0_in
{
    float4 m_31 [[user(locn0)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _41 = gl_FragCoord.w;
    float _43 = in.m_31.x;
    float _45 = gl_FragCoord.w;
    float _47 = _43 * _45;
    float _49 = in.m_31.y;
    float _51 = gl_FragCoord.w;
    float _53 = _49 * _51;
    float _55 = 1.0 / _41;
    float _57 = _55 * _47;
    float _59 = _55 * _53;
    float2 _267 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_267, float2(0.0), isnan(_267))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_267, float2(0.0), isnan(_267))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _284 = float2(_57, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_284, float2(0.0), isnan(_284))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_284, float2(0.0), isnan(_284))).x;
    bool _75 = _57 >= (*spvDescriptorSet0.fp_c3)._m0[35].x;
    bool _77 = isnan(_57);
    bool _79 = _75 || _77;
    bool _81 = isnan((*spvDescriptorSet0.fp_c3)._m0[35].x);
    bool _83 = _79 || _81;
    float _85 = precise::min(_67, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _87 = -_71;
    float _89 = fma(_87, (*spvDescriptorSet0.fp_c3)._m0[0].z, 1.0);
    float _91 = precise::min(_65, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _93 = precise::min(_69, (*spvDescriptorSet0.fp_c3)._m0[0].x);
    float _95 = _85 * 0.715200006961822509765625;
    float _97 = fma(_91, 0.2125999927520751953125, _95);
    float _99 = fma(_93, 0.072200000286102294921875, _97);
    float _101 = 1.0 / _99;
    float _103 = _101 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _105 = precise::clamp(_103, 0.0, 1.0);
    float _107 = fma(_105, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _115 = precise::clamp(_113, 0.0, 1.0);
    float _117 = _99 * _107;
    float _119 = _91 * _107;
    float _121 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _127 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _129 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _131 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[11].z, _125);
    float _133 = _85 * _107;
    float _135 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[11].w, _129);
    float _137 = _93 * _107;
    float _139 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[12].z, _131);
    float _145 = 1.0 / _89;
    float _147 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _149 = precise::clamp(_147, 0.0, 1.0);
    float _151 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].z, _143);
    float _153 = fma(_123, (*spvDescriptorSet0.fp_c3)._m0[11].x, _127);
    float _155 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[14].z, _151);
    float _161 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[12].x, _153);
    float _163 = fma(_115, (*spvDescriptorSet0.fp_c3)._m0[12].w, _135);
    float _165 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[15].z, _159);
    float _167 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].x, _161);
    float _169 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].w, _163);
    float _171 = _165;
    if (!_83)
    {
        float _173 = _165 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _171 = _173;
    }
    float _175 = _171;
    float _177 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _179 = fma(_145, (*spvDescriptorSet0.fp_c3)._m0[0].w, _177);
    float _181 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[14].x, _167);
    float _183 = fma(_149, (*spvDescriptorSet0.fp_c3)._m0[14].w, _169);
    float _185 = _175 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _187 = fma(_179, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[15].x, _181);
    float _193 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[15].w, _183);
    float _195 = -_185;
    float _197 = _195 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _199 = _189 * _189;
    float _201 = -_191;
    float _203 = _117 + _201;
    float _205 = fma(_197, (*spvDescriptorSet0.fp_c3)._m0[34].z, _185);
    float _207 = _199 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _209 = _193 * _203;
    float _211 = precise::clamp(_209, 0.0, 1.0);
    float _213 = _205 * _207;
    float _215 = _211 + _207;
    float _217 = _119 * _213;
    float _219 = _133 * _213;
    float _221 = _205 * _215;
    float _223 = _137 * _213;
    float _225 = precise::max(_217, _219);
    float _227 = _119 * _221;
    float _229 = _133 * _221;
    float _231 = _137 * _221;
    float _233 = precise::max(_223, _225);
    out.m_34.x = _227;
    out.m_34.y = _229;
    out.m_34.z = _231;
    out.m_34.w = _233;
    return out;
}

