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
    constant _16* fp_c9 [[id(0)]];
    constant _16* fp_c15 [[id(1)]];
    constant _16* fp_c8 [[id(2)]];
    texture2d<float> fp_t_tcb_A [[id(3)]];
    sampler fp_t_tcb_ASmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_ASmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_46 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_44 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_35.z;
    float _57 = gl_FragCoord.w;
    float _59 = _55 * _57;
    float _61 = in.m_35.w;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.x;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_35.y;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _53;
    float _81 = _79 * _59;
    float _83 = _79 * _65;
    float _85 = _79 * _71;
    float _87 = _79 * _77;
    float2 _322 = float2(_81, _83);
    float _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_322, float2(0.0), isnan(_322))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_322, float2(0.0), isnan(_322))).w;
    float2 _333 = float2(_85, _87);
    float _91 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_333, float2(0.0), isnan(_333))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_333, float2(0.0), isnan(_333))).w;
    float _93 = in.m_37.w;
    float _95 = gl_FragCoord.w;
    float _97 = _93 * _95;
    float _99 = in.m_39.x;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = _79 * _97;
    float _107 = _79 * _103;
    float _109 = in.m_37.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_37.y;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _89 + (-1.0);
    float _123 = _91 + _121;
    float _125 = _123 * _105;
    float _127 = 0.0 + _125;
    float _129 = precise::clamp(_127, 0.0, 1.0);
    float _131 = _129 * _107;
    bool _135 = _131 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _137 = isnan(_131);
    bool _139 = _135 || _137;
    bool _141 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _143 = _139 || _141;
    float _145 = in.m_37.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    if (!_143)
    {
        discard_fragment();
    }
    float _151 = _79 * _113;
    float _153 = _79 * _119;
    float _155 = _79 * _149;
    if (!_143)
    {
        out.m_42.x = _151;
        out.m_42.y = _153;
        out.m_42.z = _155;
        out.m_42.w = _125;
        return out;
    }
    float _157 = _153 * 0.715200006961822509765625;
    float _159 = in.m_44.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_44.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_44.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = fma(_151, 0.2125999927520751953125, _157);
    float _179 = in.m_44.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = fma(_155, 0.072200000286102294921875, _177);
    bool _187 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _189 = 1.0 / _185;
    float _191 = _189 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = fma(_193, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _197 = _79 * _163;
    float _199 = 0.0 + _131;
    float _201 = precise::clamp(_199, 0.0, 1.0);
    float _203 = _79 * _169;
    float _205 = _79 * _183;
    float _207 = _195 * _197;
    float _209 = _79 * _175;
    float _211 = fma(_155, _207, _203);
    float _213 = fma(_151, _207, _209);
    float _215 = fma(_153, _207, _205);
    float _217 = _203;
    if (!_187)
    {
        _217 = _201;
    }
    float _219 = _217;
    bool _221 = !_187;
    float _223 = _219;
    if (!_221)
    {
        float _225 = in.m_46.w;
        float _227 = gl_FragCoord.w;
        float _229 = _225 * _227;
        float _231 = in.m_46.z;
        float _233 = gl_FragCoord.w;
        float _235 = _231 * _233;
        float _237 = _79 * _229;
        float _239 = _79 * _235;
        float _241 = 1.0 / _237;
        float _243 = _239 * _241;
        float _245 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _247 = fma(_243, (*spvDescriptorSet0.fp_c8)._m0[30].w, _245);
        float _249 = 1.0 / _247;
        float _251 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _253 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _255 = fma(_249, _251, _253);
        float _257 = _255 * 8.0;
        float _259 = precise::clamp(_257, 0.0, 1.0);
        float _261 = _201 * _259;
        _223 = _261;
    }
    float _263 = _223;
    float _265 = 0.0 + _263;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    out.m_42.x = _213;
    out.m_42.y = _215;
    out.m_42.z = _211;
    out.m_42.w = _267;
    return out;
}

