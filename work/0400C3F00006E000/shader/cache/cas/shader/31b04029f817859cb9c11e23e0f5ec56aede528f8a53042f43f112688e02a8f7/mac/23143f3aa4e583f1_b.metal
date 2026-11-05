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
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_33 [[user(locn4)]];
    float4 m_44 [[user(locn6)]];
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
    float2 _275 = float2(_69, _71);
    float _73 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_275, float2(0.0), isnan(_275))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_275, float2(0.0), isnan(_275))).w;
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
    float _97 = _67 * _91;
    float _99 = -_93;
    float _101 = _73 + _99;
    float _103 = _101 * _95;
    float _105 = 0.0 + _103;
    float _107 = precise::clamp(_105, 0.0, 1.0);
    float _109 = _107 * _97;
    bool _113 = _109 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _115 = isnan(_109);
    bool _117 = _113 || _115;
    bool _119 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _121 = _117 || _119;
    float _123 = (*spvDescriptorSet0.fp_c9)._m0[191].x + 1.0;
    if (!_121)
    {
        discard_fragment();
    }
    float _125 = _123 * (*spvDescriptorSet0.fp_c9)._m0[107].x;
    float _127 = _123 * (*spvDescriptorSet0.fp_c9)._m0[107].y;
    float _129 = _123 * (*spvDescriptorSet0.fp_c9)._m0[107].z;
    if (!_121)
    {
        out.m_42.x = _125;
        out.m_42.y = _127;
        out.m_42.z = _129;
        out.m_42.w = _103;
        return out;
    }
    float _131 = _127 * 0.715200006961822509765625;
    float _133 = in.m_44.w;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_44.z;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_44.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = fma(_125, 0.2125999927520751953125, _131);
    float _153 = in.m_44.y;
    float _155 = gl_FragCoord.w;
    float _157 = _153 * _155;
    float _159 = fma(_129, 0.072200000286102294921875, _151);
    bool _161 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _163 = 1.0 / _159;
    float _165 = _163 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _167 = precise::clamp(_165, 0.0, 1.0);
    float _169 = _67 * _137;
    float _171 = fma(_167, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _173 = _67 * _143;
    float _175 = _171 * _169;
    float _177 = 0.0 + _109;
    float _179 = precise::clamp(_177, 0.0, 1.0);
    float _181 = _67 * _149;
    float _183 = _67 * _157;
    float _185 = fma(_129, _175, _173);
    float _187 = fma(_125, _175, _181);
    float _189 = fma(_127, _175, _183);
    float _191 = _173;
    if (!_161)
    {
        _191 = _179;
    }
    float _193 = _191;
    bool _195 = !_161;
    float _197 = _193;
    if (!_195)
    {
        float _199 = in.m_46.w;
        float _201 = gl_FragCoord.w;
        float _203 = _199 * _201;
        float _205 = in.m_46.z;
        float _207 = gl_FragCoord.w;
        float _209 = _205 * _207;
        float _211 = _67 * _203;
        float _213 = _67 * _209;
        float _215 = 1.0 / _211;
        float _217 = _213 * _215;
        float _219 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _221 = fma(_217, (*spvDescriptorSet0.fp_c8)._m0[30].w, _219);
        float _223 = 1.0 / _221;
        float _225 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _227 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _229 = fma(_223, _225, _227);
        float _231 = _229 * 8.0;
        float _233 = precise::clamp(_231, 0.0, 1.0);
        float _235 = _179 * _233;
        _197 = _235;
    }
    float _237 = _197;
    float _239 = 0.0 + _237;
    float _241 = precise::clamp(_239, 0.0, 1.0);
    out.m_42.x = _187;
    out.m_42.y = _189;
    out.m_42.z = _185;
    out.m_42.w = _241;
    return out;
}

