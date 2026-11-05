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
    float4 m_42 [[color(0)]];
};

struct main0_in
{
    float4 m_37 [[user(locn0)]];
    float4 m_33 [[user(locn2)]];
    float4 m_46 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_44 [[user(locn7)]];
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
    float2 _289 = float2(_69, _71);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_289, float2(0.0), isnan(_289))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_289, float2(0.0), isnan(_289))).w;
    float _75 = in.m_35.w;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_37.w;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = in.m_39.x;
    float _89 = gl_FragCoord.w;
    float _91 = _87 * _89;
    float _93 = _67 * _79;
    float _95 = _67 * _85;
    float _97 = in.m_37.x;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_37.z;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = _73 * _93;
    float _111 = _67 * _91;
    float _113 = _95 * _109;
    float _115 = 0.0 + _113;
    float _117 = precise::clamp(_115, 0.0, 1.0);
    float _119 = _117 * _111;
    bool _123 = _119 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _125 = isnan(_119);
    bool _127 = _123 || _125;
    bool _129 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _131 = _127 || _129;
    float _133 = in.m_37.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    if (!_131)
    {
        discard_fragment();
    }
    float _139 = _67 * _101;
    float _141 = _67 * _107;
    float _143 = _67 * _137;
    if (!_131)
    {
        out.m_42.x = _139;
        out.m_42.y = _143;
        out.m_42.z = _141;
        out.m_42.w = _113;
        return out;
    }
    float _145 = _143 * 0.715200006961822509765625;
    float _147 = in.m_44.w;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = in.m_44.z;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = in.m_44.x;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = fma(_139, 0.2125999927520751953125, _145);
    float _167 = in.m_44.y;
    float _169 = gl_FragCoord.w;
    float _171 = _167 * _169;
    float _173 = fma(_141, 0.072200000286102294921875, _165);
    bool _175 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _177 = 1.0 / _173;
    float _179 = _177 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _181 = precise::clamp(_179, 0.0, 1.0);
    float _183 = _67 * _151;
    float _185 = fma(_181, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _187 = _67 * _157;
    float _189 = _185 * _183;
    float _191 = 0.0 + _119;
    float _193 = precise::clamp(_191, 0.0, 1.0);
    float _195 = _67 * _163;
    float _197 = _67 * _171;
    float _199 = fma(_141, _189, _187);
    float _201 = fma(_139, _189, _195);
    float _203 = fma(_143, _189, _197);
    float _205 = _187;
    if (!_175)
    {
        _205 = _193;
    }
    float _207 = _205;
    bool _209 = !_175;
    float _211 = _207;
    if (!_209)
    {
        float _213 = in.m_46.w;
        float _215 = gl_FragCoord.w;
        float _217 = _213 * _215;
        float _219 = in.m_46.z;
        float _221 = gl_FragCoord.w;
        float _223 = _219 * _221;
        float _225 = _67 * _217;
        float _227 = _67 * _223;
        float _229 = 1.0 / _225;
        float _231 = _227 * _229;
        float _233 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _235 = fma(_231, (*spvDescriptorSet0.fp_c8)._m0[30].w, _233);
        float _237 = 1.0 / _235;
        float _239 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _241 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _243 = fma(_237, _239, _241);
        float _245 = _243 * 8.0;
        float _247 = precise::clamp(_245, 0.0, 1.0);
        float _249 = _193 * _247;
        _211 = _249;
    }
    float _251 = _211;
    float _253 = 0.0 + _251;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    out.m_42.x = _201;
    out.m_42.y = _203;
    out.m_42.z = _199;
    out.m_42.w = _255;
    return out;
}

