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
    float4 m_50 [[user(locn2)]];
    float4 m_39 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_33 [[user(locn5), flat]];
    float4 m_46 [[user(locn7)]];
    float4 m_48 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = gl_FragCoord.w;
    float _59 = in.m_33.x;
    float _61 = in.m_35.x;
    float _63 = gl_FragCoord.w;
    float _65 = _61 * _63;
    float _67 = in.m_35.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = 1.0 / _57;
    float _75 = rint(_59);
    float _77 = precise::max(_75, 0.0);
    uint _80 = uint(_77);
    uint _82 = clamp(_80, 0u, 65535u);
    float _84 = _73 * _65;
    float _86 = _73 * _71;
    float3 _370 = float3(_84, _86, float(int(_82)));
    float3 _374 = select(_370, float3(0.0), isnan(_370));
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, _374.xy, uint(rint(_374.z))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, _374.xy, uint(rint(_374.z))).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = in.m_37.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_39.x;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_37.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _73 * _103;
    float _119 = in.m_37.y;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_41.y;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_37.z;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_41.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = _73 * _115;
    float _145 = _73 * _123;
    float _147 = _73 * _129;
    float _149 = _73 * _141;
    float _151 = -_147;
    float _153 = _145 + _151;
    float _155 = _97 * _117;
    float _157 = _73 * _109;
    float _159 = 0.0 + _155;
    float _161 = precise::clamp(_159, 0.0, 1.0);
    float _163 = _161 * _157;
    bool _167 = _163 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _169 = isnan(_163);
    bool _171 = _167 || _169;
    bool _173 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _175 = _171 || _173;
    float _177 = in.m_41.x;
    float _179 = gl_FragCoord.w;
    float _181 = _177 * _179;
    if (!_175)
    {
        discard_fragment();
    }
    float _183 = _73 * _135;
    float _185 = fma(_93, _153, _147);
    float _187 = -_149;
    float _189 = _183 + _187;
    float _191 = fma(_95, _189, _149);
    float _193 = _73 * _181;
    float _195 = -_193;
    float _197 = _143 + _195;
    float _199 = fma(_91, _197, _193);
    if (!_175)
    {
        out.m_44.x = _199;
        out.m_44.y = _185;
        out.m_44.z = _191;
        out.m_44.w = _155;
        return out;
    }
    float _201 = _185 * 0.715200006961822509765625;
    float _203 = in.m_46.y;
    float _205 = gl_FragCoord.w;
    float _207 = _203 * _205;
    float _209 = in.m_48.w;
    float _211 = gl_FragCoord.w;
    float _213 = _209 * _211;
    float _215 = in.m_48.z;
    float _217 = gl_FragCoord.w;
    float _219 = _215 * _217;
    float _221 = fma(_199, 0.2125999927520751953125, _201);
    float _223 = in.m_48.x;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_48.y;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = fma(_191, 0.072200000286102294921875, _221);
    bool _237 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _239 = 1.0 / _235;
    float _241 = _239 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _243 = precise::clamp(_241, 0.0, 1.0);
    float _245 = _73 * _207;
    float _247 = fma(_243, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _249 = _73 * _213;
    float _251 = _73 * _219;
    float _253 = _163 * _245;
    float _255 = precise::clamp(_253, 0.0, 1.0);
    float _257 = _247 * _249;
    float _259 = _73 * _227;
    float _261 = _73 * _233;
    float _263 = fma(_191, _257, _251);
    float _265 = fma(_199, _257, _259);
    float _267 = fma(_185, _257, _261);
    float _269 = _251;
    if (!_237)
    {
        _269 = _255;
    }
    float _271 = _269;
    bool _273 = !_237;
    float _275 = _271;
    if (!_273)
    {
        float _277 = in.m_50.w;
        float _279 = gl_FragCoord.w;
        float _281 = _277 * _279;
        float _283 = in.m_50.z;
        float _285 = gl_FragCoord.w;
        float _287 = _283 * _285;
        float _289 = _73 * _281;
        float _291 = _73 * _287;
        float _293 = 1.0 / _289;
        float _295 = _291 * _293;
        float _297 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _299 = fma(_295, (*spvDescriptorSet0.fp_c8)._m0[30].w, _297);
        float _301 = 1.0 / _299;
        float _303 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _305 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _307 = fma(_301, _303, _305);
        float _309 = _307 * 8.0;
        float _311 = precise::clamp(_309, 0.0, 1.0);
        float _313 = _255 * _311;
        _275 = _313;
    }
    float _315 = _275;
    float _317 = 0.0 + _315;
    float _319 = precise::clamp(_317, 0.0, 1.0);
    out.m_44.x = _265;
    out.m_44.y = _267;
    out.m_44.z = _263;
    out.m_44.w = _319;
    return out;
}

