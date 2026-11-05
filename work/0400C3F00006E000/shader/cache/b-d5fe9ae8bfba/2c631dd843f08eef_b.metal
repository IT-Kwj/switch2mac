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
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    sampler fp_t_tcb_8Smplr_w [[id(5)]];
    constant dm_border_t* dm_border [[id(6)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_33.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _301 = float2(_71, _73);
    float _75 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_301, float2(0.0), isnan(_301))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_301, float2(0.0), isnan(_301))).w;
    float _77 = in.m_35.w;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_37.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_39.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_41.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = _69 * _81;
    float _103 = _69 * _87;
    float _105 = _69 * _99;
    float _107 = in.m_37.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _75 * _101;
    float _115 = _69 * _93;
    float _117 = _103 * _113;
    float _119 = _115 * _117;
    float _121 = 0.0 + _119;
    float _123 = precise::clamp(_121, 0.0, 1.0);
    float _125 = _123 * _105;
    bool _129 = _125 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _131 = isnan(_125);
    bool _133 = _129 || _131;
    bool _135 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _137 = _133 || _135;
    float _139 = in.m_37.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_37.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    if (!_137)
    {
        discard_fragment();
    }
    float _151 = _69 * _143;
    float _153 = _69 * _111;
    float _155 = _69 * _149;
    if (!_137)
    {
        out.m_44.x = _151;
        out.m_44.y = _153;
        out.m_44.z = _155;
        out.m_44.w = _119;
        return out;
    }
    float _157 = _153 * 0.715200006961822509765625;
    float _159 = in.m_46.w;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_46.z;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    float _171 = in.m_46.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    float _177 = fma(_151, 0.2125999927520751953125, _157);
    float _179 = in.m_46.y;
    float _181 = gl_FragCoord.w;
    float _183 = _179 * _181;
    float _185 = fma(_155, 0.072200000286102294921875, _177);
    bool _187 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _189 = 1.0 / _185;
    float _191 = _189 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _69 * _163;
    float _197 = fma(_193, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _199 = _69 * _169;
    float _201 = _197 * _195;
    float _203 = 0.0 + _125;
    float _205 = precise::clamp(_203, 0.0, 1.0);
    float _207 = _69 * _175;
    float _209 = _69 * _183;
    float _211 = fma(_155, _201, _199);
    float _213 = fma(_151, _201, _207);
    float _215 = fma(_153, _201, _209);
    float _217 = _199;
    if (!_187)
    {
        _217 = _205;
    }
    float _219 = _217;
    bool _221 = !_187;
    float _223 = _219;
    if (!_221)
    {
        float _225 = in.m_48.w;
        float _227 = gl_FragCoord.w;
        float _229 = _225 * _227;
        float _231 = in.m_48.z;
        float _233 = gl_FragCoord.w;
        float _235 = _231 * _233;
        float _237 = _69 * _229;
        float _239 = _69 * _235;
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
        float _261 = _205 * _259;
        _223 = _261;
    }
    float _263 = _223;
    float _265 = 0.0 + _263;
    float _267 = precise::clamp(_265, 0.0, 1.0);
    out.m_44.x = _213;
    out.m_44.y = _215;
    out.m_44.z = _211;
    out.m_44.w = _267;
    return out;
}

