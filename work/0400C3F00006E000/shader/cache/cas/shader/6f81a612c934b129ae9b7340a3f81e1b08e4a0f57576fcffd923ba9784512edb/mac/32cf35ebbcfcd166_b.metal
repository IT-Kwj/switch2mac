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
    float4 m_48 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
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
    float3 _366 = float3(_82, _84, float(int(_80)));
    float3 _370 = select(_366, float3(0.0), isnan(_366));
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _370.xy, uint(rint(_370.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _370.xy, uint(rint(_370.z))).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_37.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_39.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_37.x;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _71 * _101;
    float _117 = in.m_37.y;
    float _119 = gl_FragCoord.w;
    float _121 = _117 * _119;
    float _123 = in.m_41.y;
    float _125 = gl_FragCoord.w;
    float _127 = _123 * _125;
    float _129 = in.m_37.z;
    float _131 = gl_FragCoord.w;
    float _133 = _129 * _131;
    float _135 = in.m_41.z;
    float _137 = gl_FragCoord.w;
    float _139 = _135 * _137;
    float _141 = _71 * _113;
    float _143 = _71 * _121;
    float _145 = _71 * _127;
    float _147 = _71 * _139;
    float _149 = _95 * _115;
    float _151 = _71 * _107;
    float _153 = 0.0 + _149;
    float _155 = precise::clamp(_153, 0.0, 1.0);
    float _157 = _155 * _151;
    bool _161 = _157 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _163 = isnan(_157);
    bool _165 = _161 || _163;
    bool _167 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _169 = _165 || _167;
    float _171 = in.m_41.x;
    float _173 = gl_FragCoord.w;
    float _175 = _171 * _173;
    if (!_169)
    {
        discard_fragment();
    }
    float _177 = _71 * _133;
    float _179 = -_145;
    float _181 = _143 + _179;
    float _183 = _91 * _91;
    float _185 = -_147;
    float _187 = _177 + _185;
    float _189 = _93 * _93;
    float _191 = fma(_183, _181, _145);
    float _193 = fma(_189, _187, _147);
    float _195 = _71 * _175;
    float _197 = -_195;
    float _199 = _141 + _197;
    float _201 = _89 * _89;
    float _203 = fma(_201, _199, _195);
    if (!_169)
    {
        out.m_44.x = _203;
        out.m_44.y = _191;
        out.m_44.z = _193;
        out.m_44.w = _149;
        return out;
    }
    float _205 = _191 * 0.715200006961822509765625;
    float _207 = in.m_46.w;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_46.z;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = in.m_46.x;
    float _221 = gl_FragCoord.w;
    float _223 = _219 * _221;
    float _225 = fma(_203, 0.2125999927520751953125, _205);
    float _227 = in.m_46.y;
    float _229 = gl_FragCoord.w;
    float _231 = _227 * _229;
    float _233 = 0.0 + _157;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = fma(_193, 0.072200000286102294921875, _225);
    bool _239 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _241 = 1.0 / _237;
    float _243 = _241 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _245 = precise::clamp(_243, 0.0, 1.0);
    float _247 = _71 * _211;
    float _249 = fma(_245, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _251 = _71 * _217;
    float _253 = _249 * _247;
    float _255 = _71 * _223;
    float _257 = _71 * _231;
    float _259 = fma(_193, _253, _251);
    float _261 = fma(_203, _253, _255);
    float _263 = fma(_191, _253, _257);
    float _265 = _251;
    if (!_239)
    {
        _265 = _235;
    }
    float _267 = _265;
    bool _269 = !_239;
    float _271 = _267;
    if (!_269)
    {
        float _273 = in.m_48.w;
        float _275 = gl_FragCoord.w;
        float _277 = _273 * _275;
        float _279 = in.m_48.z;
        float _281 = gl_FragCoord.w;
        float _283 = _279 * _281;
        float _285 = _71 * _277;
        float _287 = _71 * _283;
        float _289 = 1.0 / _285;
        float _291 = _287 * _289;
        float _293 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _295 = fma(_291, (*spvDescriptorSet0.fp_c8)._m0[30].w, _293);
        float _297 = 1.0 / _295;
        float _299 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _301 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _303 = fma(_297, _299, _301);
        float _305 = _303 * 8.0;
        float _307 = precise::clamp(_305, 0.0, 1.0);
        float _309 = _235 * _307;
        _271 = _309;
    }
    float _311 = _271;
    float _313 = 0.0 + _311;
    float _315 = precise::clamp(_313, 0.0, 1.0);
    out.m_44.x = _261;
    out.m_44.y = _263;
    out.m_44.z = _259;
    out.m_44.w = _315;
    return out;
}

