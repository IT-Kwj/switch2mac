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
    texture2d_array<float> fp_t_tcb_8 [[id(3)]];
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
    float4 m_41 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_33 [[user(locn5), flat]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _53 = gl_FragCoord.w;
    float _55 = in.m_33.x;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _53;
    float _71 = rint(_55);
    float _73 = precise::max(_71, 0.0);
    uint _76 = uint(_73);
    uint _78 = clamp(_76, 0u, 65535u);
    float _80 = _69 * _61;
    float _82 = _69 * _67;
    float3 _330 = float3(_80, _82, float(int(_78)));
    float3 _334 = select(_330, float3(0.0), isnan(_330));
    float4 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _334.xy, uint(rint(_334.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _334.xy, uint(rint(_334.z))).xyzw;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = _85.z;
    float _93 = _85.w;
    float _95 = in.m_37.w;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_37.x;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = _69 * _99;
    float _115 = _69 * _105;
    float _117 = in.m_41.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_37.z;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_41.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = _69 * _111;
    float _137 = _69 * _121;
    float _139 = _93 * _113;
    float _141 = 0.0 + _139;
    float _143 = precise::clamp(_141, 0.0, 1.0);
    float _145 = _143 * _115;
    bool _149 = _145 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _151 = isnan(_145);
    bool _153 = _149 || _151;
    bool _155 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _157 = _153 || _155;
    float _159 = in.m_37.y;
    float _161 = gl_FragCoord.w;
    float _163 = _159 * _161;
    float _165 = in.m_41.x;
    float _167 = gl_FragCoord.w;
    float _169 = _165 * _167;
    if (!_157)
    {
        discard_fragment();
    }
    float _171 = _69 * _127;
    float _173 = _69 * _163;
    float _175 = _69 * _169;
    float _177 = _69 * _133;
    float _179 = -_137;
    float _181 = _173 + _179;
    float _183 = -_175;
    float _185 = _135 + _183;
    float _187 = -_177;
    float _189 = _171 + _187;
    float _191 = _87 * _87;
    float _193 = _89 * _89;
    float _195 = _91 * _91;
    float _197 = fma(_191, _185, _175);
    float _199 = fma(_193, _181, _137);
    float _201 = fma(_195, _189, _177);
    if (!_157)
    {
        out.m_44.x = _197;
        out.m_44.y = _199;
        out.m_44.z = _201;
        out.m_44.w = _139;
        return out;
    }
    float _203 = _199 * 0.715200006961822509765625;
    float _205 = 0.0 + _145;
    float _207 = precise::clamp(_205, 0.0, 1.0);
    float _209 = fma(_197, 0.2125999927520751953125, _203);
    bool _211 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _213 = fma(_201, 0.072200000286102294921875, _209);
    float _215 = 1.0 / _213;
    float _217 = _215 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _219 = precise::clamp(_217, 0.0, 1.0);
    float _221 = fma(_219, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _223 = _197 * _221;
    float _225 = _199 * _221;
    float _227 = _201 * _221;
    float _229 = _221;
    if (!_211)
    {
        _229 = _207;
    }
    float _231 = _229;
    bool _233 = !_211;
    float _235 = _231;
    if (!_233)
    {
        float _237 = in.m_46.w;
        float _239 = gl_FragCoord.w;
        float _241 = _237 * _239;
        float _243 = in.m_46.z;
        float _245 = gl_FragCoord.w;
        float _247 = _243 * _245;
        float _249 = _69 * _241;
        float _251 = _69 * _247;
        float _253 = 1.0 / _249;
        float _255 = _251 * _253;
        float _257 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _259 = fma(_255, (*spvDescriptorSet0.fp_c8)._m0[30].w, _257);
        float _261 = 1.0 / _259;
        float _263 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _265 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _267 = fma(_261, _263, _265);
        float _269 = _267 * 8.0;
        float _271 = precise::clamp(_269, 0.0, 1.0);
        float _273 = _207 * _271;
        _235 = _273;
    }
    float _275 = _235;
    float _277 = 0.0 + _275;
    float _279 = precise::clamp(_277, 0.0, 1.0);
    out.m_44.x = _223;
    out.m_44.y = _225;
    out.m_44.z = _227;
    out.m_44.w = _279;
    return out;
}

