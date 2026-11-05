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
    float2 _283 = float2(_57, _59);
    float3 _63 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_283, float2(0.0), isnan(_283))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_283, float2(0.0), isnan(_283))).xyz;
    float _65 = _63.x;
    float _67 = _63.y;
    float _69 = _63.z;
    float2 _300 = float2(_57, _59);
    float _71 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_300, float2(0.0), isnan(_300))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_300, float2(0.0), isnan(_300))).x;
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
    float _105 = -(*spvDescriptorSet0.fp_c3)._m0[0].w;
    float _107 = fma(_97, (*spvDescriptorSet0.fp_c3)._m0[0].w, _105);
    float _109 = _103 * (*spvDescriptorSet0.fp_c3)._m0[26].z;
    float _111 = precise::clamp(_109, 0.0, 1.0);
    float _113 = fma(_111, (*spvDescriptorSet0.fp_c3)._m0[26].y, (*spvDescriptorSet0.fp_c3)._m0[26].x);
    float _115 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[1].x, (*spvDescriptorSet0.fp_c3)._m0[1].y);
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _91 * _113;
    float _121 = _85 * _113;
    float _123 = _93 * _113;
    float _125 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[10].x, (*spvDescriptorSet0.fp_c3)._m0[9].x);
    float _127 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[10].z, (*spvDescriptorSet0.fp_c3)._m0[9].z);
    float _129 = fma(_117, (*spvDescriptorSet0.fp_c3)._m0[10].w, (*spvDescriptorSet0.fp_c3)._m0[9].w);
    float _131 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[1].z, (*spvDescriptorSet0.fp_c3)._m0[1].w);
    float _133 = precise::clamp(_131, 0.0, 1.0);
    float _135 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].x, (*spvDescriptorSet0.fp_c3)._m0[2].y);
    float _137 = precise::clamp(_135, 0.0, 1.0);
    float _139 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[2].z, (*spvDescriptorSet0.fp_c3)._m0[2].w);
    float _141 = precise::clamp(_139, 0.0, 1.0);
    float _143 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[11].x, _125);
    float _145 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[11].z, _127);
    float _147 = fma(_133, (*spvDescriptorSet0.fp_c3)._m0[11].w, _129);
    float _149 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[12].x, _143);
    float _151 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[12].z, _145);
    float _153 = fma(_137, (*spvDescriptorSet0.fp_c3)._m0[12].w, _147);
    float _155 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[3].x, (*spvDescriptorSet0.fp_c3)._m0[3].y);
    float _157 = precise::clamp(_155, 0.0, 1.0);
    float _159 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].x, _149);
    float _161 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].z, _151);
    float _163 = fma(_141, (*spvDescriptorSet0.fp_c3)._m0[13].w, _153);
    float _165 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[14].x, _159);
    float _167 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[14].z, _161);
    float _169 = fma(_157, (*spvDescriptorSet0.fp_c3)._m0[14].w, _163);
    float _171 = fma(_113, (*spvDescriptorSet0.fp_c3)._m0[3].z, (*spvDescriptorSet0.fp_c3)._m0[3].w);
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _101 * _113;
    float _177 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[15].x, _165);
    float _179 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[15].z, _167);
    float _181 = fma(_173, (*spvDescriptorSet0.fp_c3)._m0[15].w, _169);
    float _183 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[27].x, (*spvDescriptorSet0.fp_c3)._m0[27].y);
    float _185 = precise::clamp(_183, 0.0, 1.0);
    float _187 = fma(_107, (*spvDescriptorSet0.fp_c3)._m0[27].z, (*spvDescriptorSet0.fp_c3)._m0[27].w);
    float _189 = precise::clamp(_187, 0.0, 1.0);
    float _191 = -_177;
    float _193 = _175 + _191;
    float _195 = _179;
    if (!_83)
    {
        float _197 = _179 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
        _195 = _197;
    }
    float _199 = _195;
    float _201 = -(*spvDescriptorSet0.fp_c3)._m0[28].x;
    float _203 = _201 + (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _205 = _185 * _185;
    float _207 = _189 * _189;
    float _209 = _199 * (*spvDescriptorSet0.fp_c3)._m0[34].x;
    float _211 = _181 * _193;
    float _213 = precise::clamp(_211, 0.0, 1.0);
    float _215 = fma(_205, _203, (*spvDescriptorSet0.fp_c3)._m0[28].x);
    float _217 = _207 * (*spvDescriptorSet0.fp_c3)._m0[28].z;
    float _219 = -_209;
    float _221 = _219 + (*spvDescriptorSet0.fp_c3)._m0[34].y;
    float _223 = fma(_213, _215, _217);
    float _225 = fma(_221, (*spvDescriptorSet0.fp_c3)._m0[34].z, _209);
    float _227 = -_213;
    float _229 = _227 + _223;
    float _231 = _225 * _223;
    float _233 = _225 * _229;
    float _235 = _119 * _233;
    float _237 = _121 * _233;
    float _239 = _123 * _233;
    float _241 = _119 * _231;
    float _243 = _121 * _231;
    float _245 = _123 * _231;
    float _247 = precise::max(_235, _237);
    float _249 = precise::max(_239, _247);
    out.m_34.x = _241;
    out.m_34.y = _243;
    out.m_34.z = _245;
    out.m_34.w = _249;
    return out;
}

