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
    float2 _291 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_291, float2(0.0), isnan(_291))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_291, float2(0.0), isnan(_291))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _308 = float2(_57, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_308, float2(0.0), isnan(_308))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_308, float2(0.0), isnan(_308))).x;
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
    float _97 = 1.0 / _89;
    float _99 = fma(_91, 0.2125999927520751953125, _95);
    float _101 = fma(_93, 0.072200000286102294921875, _99);
    float _103 = 1.0 / _101;
    float _105 = _103 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _111 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _113 = precise::clamp(_111, 0.0, 1.0);
    float _115 = _101 * _109;
    float _117 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _119 = precise::clamp(_117, 0.0, 1.0);
    float _121 = _91 * _109;
    float _123 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _125 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[10].y, (*spvDescriptorSet0.fp_c3)._m0[9].y);
    float _127 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _129 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _131 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[11].x, _123);
    float _133 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[11].y, _125);
    float _135 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[11].z, _127);
    float _137 = fma(_119, (*spvDescriptorSet0.fp_c3)._m0[11].w, _129);
    float _139 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = 1.0 / _115;
    float _145 = _85 * _109;
    float _147 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[12].x, _131);
    float _149 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[12].y, _133);
    float _151 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[12].z, _135);
    float _153 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[12].w, _137);
    float _155 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _93 * _109;
    float _165 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[13].x, _147);
    float _167 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[13].y, _149);
    float _169 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[13].z, _151);
    float _171 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[13].w, _153);
    float _173 = fma(_109, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _175 = precise::clamp(_173, 0.0, 1.0);
    float _177 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[14].x, _165);
    float _179 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[14].z, _169);
    float _181 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[14].y, _167);
    float _183 = fma(_161, (*spvDescriptorSet0.fp_c3)._m0[14].w, _171);
    float _185 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[15].x, _177);
    float _187 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _189 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[0].w, _187);
    float _191 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[15].z, _179);
    float _193 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[15].y, _181);
    float _195 = fma(_175, (*spvDescriptorSet0.fp_c3)._m0[15].w, _183);
    float _197 = -_185;
    float _199 = _115 + _197;
    float _201 = _191;
    if (!_83)
    {
        float _203 = _191 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _201 = _203;
    }
    float _205 = _201;
    float _207 = _193 * _143;
    float _209 = precise::clamp(_207, 0.0, 1.0);
    float _211 = fma(_189, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = _195 * _199;
    float _217 = precise::clamp(_215, 0.0, 1.0);
    float _219 = _205 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _221 = _213 * _213;
    float _223 = _217 * _209;
    float _225 = -_219;
    float _227 = _225 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _229 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[28].z, _223);
    float _231 = precise::clamp(_229, 0.0, 1.0);
    float _233 = fma(_227, (*spvDescriptorSet0.fp_c3)._m0[34].z, _219);
    float _235 = -_223;
    float _237 = _235 + _231;
    float _239 = _233 * _231;
    float _241 = _233 * _237;
    float _243 = _121 * _241;
    float _245 = _145 * _241;
    float _247 = _163 * _241;
    float _249 = _121 * _239;
    float _251 = _145 * _239;
    float _253 = _163 * _239;
    float _255 = precise::max(_243, _245);
    float _257 = precise::max(_247, _255);
    out.m_34.x = _249;
    out.m_34.y = _251;
    out.m_34.z = _253;
    out.m_34.w = _257;
    return out;
}

