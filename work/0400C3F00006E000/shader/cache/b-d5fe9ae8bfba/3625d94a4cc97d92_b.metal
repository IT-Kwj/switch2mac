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
    float4 m_39 [[user(locn1)]];
    float4 m_46 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
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
    float2 _344;
    _344.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_69, _71));
    _344.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_69, _71));
    float _73 = _344.x;
    float _75 = _73 * 256.0;
    int _78 = int(_75);
    float _80 = float(uint(_78));
    float _82 = _80 * 0.00390625;
    float _84 = precise::min(_82, 2.0);
    float2 _364 = float2(_69, _71);
    float4 _87 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_364, float2(0.0), isnan(_364)), level(_84)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_364, float2(0.0), isnan(_364)), level(_84)).xyzw;
    float _89 = _87.x;
    float _91 = _87.y;
    float _93 = _87.z;
    float _95 = _87.w;
    float _97 = in.m_35.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_37.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_35.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = _67 * _101;
    float _117 = _67 * _107;
    float _119 = in.m_39.x;
    float _121 = gl_FragCoord.w;
    float _123 = _119 * _121;
    float _125 = in.m_35.x;
    float _127 = gl_FragCoord.w;
    float _129 = _125 * _127;
    float _131 = in.m_39.y;
    float _133 = gl_FragCoord.w;
    float _135 = _131 * _133;
    float _137 = in.m_35.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_39.z;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = _67 * _113;
    float _151 = _67 * _129;
    float _153 = _67 * _135;
    float _155 = _67 * _141;
    float _157 = _67 * _147;
    float _159 = -_153;
    float _161 = _149 + _159;
    float _163 = -_157;
    float _165 = _155 + _163;
    float _167 = _95 * _115;
    float _169 = 0.0 + _167;
    float _171 = precise::clamp(_169, 0.0, 1.0);
    float _173 = _171 * _117;
    bool _177 = _173 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _179 = isnan(_173);
    bool _181 = _177 || _179;
    bool _183 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _185 = _181 || _183;
    if (!_185)
    {
        discard_fragment();
    }
    float _187 = _67 * _123;
    float _189 = fma(_91, _161, _153);
    float _191 = fma(_93, _165, _157);
    float _193 = -_187;
    float _195 = _151 + _193;
    float _197 = fma(_89, _195, _187);
    if (!_185)
    {
        out.m_42.x = _197;
        out.m_42.y = _189;
        out.m_42.z = _191;
        out.m_42.w = _167;
        return out;
    }
    float _199 = _189 * 0.715200006961822509765625;
    float _201 = in.m_44.w;
    float _203 = gl_FragCoord.w;
    float _205 = _201 * _203;
    float _207 = in.m_44.z;
    float _209 = gl_FragCoord.w;
    float _211 = _207 * _209;
    float _213 = in.m_44.x;
    float _215 = gl_FragCoord.w;
    float _217 = _213 * _215;
    float _219 = fma(_197, 0.2125999927520751953125, _199);
    float _221 = in.m_44.y;
    float _223 = gl_FragCoord.w;
    float _225 = _221 * _223;
    float _227 = fma(_191, 0.072200000286102294921875, _219);
    bool _229 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _231 = 1.0 / _227;
    float _233 = _231 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _235 = precise::clamp(_233, 0.0, 1.0);
    float _237 = fma(_235, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _239 = _67 * _205;
    float _241 = _67 * _211;
    float _243 = _237 * _239;
    float _245 = 0.0 + _173;
    float _247 = precise::clamp(_245, 0.0, 1.0);
    float _249 = _67 * _217;
    float _251 = _67 * _225;
    float _253 = fma(_191, _243, _241);
    float _255 = fma(_197, _243, _249);
    float _257 = fma(_189, _243, _251);
    float _259 = _241;
    if (!_229)
    {
        _259 = _247;
    }
    float _261 = _259;
    bool _263 = !_229;
    float _265 = _261;
    if (!_263)
    {
        float _267 = in.m_46.w;
        float _269 = gl_FragCoord.w;
        float _271 = _267 * _269;
        float _273 = in.m_46.z;
        float _275 = gl_FragCoord.w;
        float _277 = _273 * _275;
        float _279 = _67 * _271;
        float _281 = _67 * _277;
        float _283 = 1.0 / _279;
        float _285 = _281 * _283;
        float _287 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _289 = fma(_285, (*spvDescriptorSet0.fp_c8)._m0[30].w, _287);
        float _291 = 1.0 / _289;
        float _293 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _295 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _297 = fma(_291, _293, _295);
        float _299 = _297 * 8.0;
        float _301 = precise::clamp(_299, 0.0, 1.0);
        float _303 = _247 * _301;
        _265 = _303;
    }
    float _305 = _265;
    float _307 = 0.0 + _305;
    float _309 = precise::clamp(_307, 0.0, 1.0);
    out.m_42.x = _255;
    out.m_42.y = _257;
    out.m_42.z = _253;
    out.m_42.w = _309;
    return out;
}

