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
    float4 m_39 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_33 [[user(locn5), flat]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_33.x;
    float _59 = in.m_35.x;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_35.y;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = 1.0 / _55;
    float _73 = rint(_57);
    float _75 = precise::max(_73, 0.0);
    uint _78 = uint(_75);
    uint _80 = clamp(_78, 0u, 65535u);
    float _82 = _71 * _63;
    float _84 = _71 * _69;
    float3 _378 = float3(_82, _84, float(int(_80)));
    float3 _382 = select(_378, float3(0.0), isnan(_378));
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _382.xy, uint(rint(_382.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _382.xy, uint(rint(_382.z))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_37.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.w;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_41.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _71 * _101;
    float _117 = _71 * _107;
    float _119 = in.m_37.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_39.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_39.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_37.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_39.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _71 * _123;
    float _151 = _71 * _129;
    float _153 = _71 * _135;
    float _155 = -_151;
    float _157 = _149 + _155;
    float _159 = -_115;
    float _161 = _95 + _159;
    float _163 = _117 * _161;
    float _165 = _71 * _113;
    float _167 = 0.0 + _163;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _169 * _165;
    bool _175 = _171 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _177 = isnan(_171);
    bool _179 = _175 || _177;
    bool _181 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _183 = _179 || _181;
    float _185 = in.m_37.y;
    float _187 = gl_FragCoord.w;
    float _189 = _185 * _187;
    if (!_183)
    {
        discard_fragment();
    }
    float _191 = _71 * _141;
    float _193 = _89 * _89;
    float _195 = fma(_193, _157, _151);
    float _197 = _71 * _189;
    float _199 = _71 * _147;
    float _201 = -_153;
    float _203 = _197 + _201;
    float _205 = -_199;
    float _207 = _191 + _205;
    float _209 = _91 * _91;
    float _211 = _93 * _93;
    float _213 = fma(_209, _203, _153);
    float _215 = fma(_211, _207, _199);
    if (!_183)
    {
        out.m_44.x = _195;
        out.m_44.y = _213;
        out.m_44.z = _215;
        out.m_44.w = _163;
        return out;
    }
    float _217 = _213 * 0.715200006961822509765625;
    float _219 = in.m_46.w;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = in.m_46.z;
    float _227 = gl_FragCoord.w;
    float _229 = _225 * _227;
    float _231 = in.m_46.x;
    float _233 = gl_FragCoord.w;
    float _235 = _231 * _233;
    float _237 = fma(_195, 0.2125999927520751953125, _217);
    float _239 = in.m_46.y;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = 0.0 + _171;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = fma(_215, 0.072200000286102294921875, _237);
    bool _251 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _253 = 1.0 / _249;
    float _255 = _253 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _257 = precise::clamp(_255, 0.0, 1.0);
    float _259 = _71 * _223;
    float _261 = fma(_257, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _263 = _71 * _229;
    float _265 = _261 * _259;
    float _267 = _71 * _235;
    float _269 = _71 * _243;
    float _271 = fma(_215, _265, _263);
    float _273 = fma(_195, _265, _267);
    float _275 = fma(_213, _265, _269);
    float _277 = _263;
    if (!_251)
    {
        _277 = _247;
    }
    float _279 = _277;
    bool _281 = !_251;
    float _283 = _279;
    if (!_281)
    {
        float _285 = in.m_48.w;
        float _287 = gl_FragCoord.w;
        float _289 = _285 * _287;
        float _291 = in.m_48.z;
        float _293 = gl_FragCoord.w;
        float _295 = _291 * _293;
        float _297 = _71 * _289;
        float _299 = _71 * _295;
        float _301 = 1.0 / _297;
        float _303 = _299 * _301;
        float _305 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _307 = fma(_303, (*spvDescriptorSet0.fp_c8)._m0[30].w, _305);
        float _309 = 1.0 / _307;
        float _311 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _313 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _315 = fma(_309, _311, _313);
        float _317 = _315 * 8.0;
        float _319 = precise::clamp(_317, 0.0, 1.0);
        float _321 = _247 * _319;
        _283 = _321;
    }
    float _323 = _283;
    float _325 = 0.0 + _323;
    float _327 = precise::clamp(_325, 0.0, 1.0);
    out.m_44.x = _273;
    out.m_44.y = _275;
    out.m_44.z = _271;
    out.m_44.w = _327;
    return out;
}

