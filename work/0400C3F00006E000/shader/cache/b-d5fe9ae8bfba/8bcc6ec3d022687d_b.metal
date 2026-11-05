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
    constant _16* fp_c8 [[id(0)]];
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
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
    float4 m_35 [[user(locn0)]];
    float4 m_37 [[user(locn1)]];
    float4 m_31 [[user(locn2), flat]];
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_39 [[user(locn5)]];
    float4 m_46 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = in.m_31.y;
    float _57 = in.m_31.x;
    float _59 = in.m_31.z;
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.w;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.w;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_39.x;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = -_55;
    float _83 = _81 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _85 = -_57;
    float _87 = _85 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _89 = -_59;
    float _91 = _89 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _93 = 1.0 / _61;
    float _95 = _83 * _83;
    float _97 = fma(_87, _87, _95);
    float _99 = fma(_91, _91, _97);
    float _101 = sqrt(_99);
    float _103 = _93 * _67;
    float _105 = _93 * _73;
    float _107 = _103 * _105;
    float _109 = precise::max(_101, 20.0);
    float _111 = _93 * _79;
    float _113 = precise::min(_109, 110.0);
    float _115 = fma(_113, 0.011111111380159854888916015625, -0.22222222387790679931640625);
    float _117 = _107 * _115;
    float _119 = 0.0 + _117;
    float _121 = precise::clamp(_119, 0.0, 1.0);
    float _123 = _121 * _111;
    bool _127 = _123 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _129 = isnan(_123);
    bool _131 = _127 || _129;
    bool _133 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _135 = _131 || _133;
    float _137 = in.m_41.x;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_41.y;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    if (!_135)
    {
        discard_fragment();
    }
    float _149 = _93 * _141;
    float _151 = _93 * _147;
    float2 _494 = float2(_149, _151);
    float3 _155 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_494, float2(0.0), isnan(_494))).xyz;
    float _157 = _155.x;
    float _159 = _155.y;
    float _161 = _155.z;
    float _163 = in.m_37.x;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = in.m_37.y;
    float _171 = gl_FragCoord.w;
    float _173 = _169 * _171;
    float _175 = in.m_37.z;
    float _177 = gl_FragCoord.w;
    float _179 = _175 * _177;
    float _181 = in.m_35.x;
    float _183 = gl_FragCoord.w;
    float _185 = _181 * _183;
    float _187 = in.m_35.y;
    float _189 = gl_FragCoord.w;
    float _191 = _187 * _189;
    float _193 = in.m_35.z;
    float _195 = gl_FragCoord.w;
    float _197 = _193 * _195;
    float _199 = _93 * _167;
    float _201 = _93 * _173;
    float _203 = _93 * _179;
    float _205 = -_157;
    float _207 = _205 + 1.0;
    float _209 = -_159;
    float _211 = _209 + 1.0;
    float _213 = -_161;
    float _215 = _213 + 1.0;
    float _217 = _199 * _207;
    float _219 = _201 * _211;
    float _221 = _203 * _215;
    float _223 = _93 * _185;
    float _225 = _93 * _191;
    float _227 = _93 * _197;
    float _229 = fma(_157, _223, _217);
    float _231 = fma(_159, _225, _219);
    float _233 = fma(_161, _227, _221);
    if (!_135)
    {
        out.m_44.x = _229;
        out.m_44.y = _231;
        out.m_44.z = _233;
        out.m_44.w = _117;
        return out;
    }
    float _235 = _231 * 0.715200006961822509765625;
    float _237 = in.m_46.w;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_46.z;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_46.x;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = fma(_229, 0.2125999927520751953125, _235);
    float _257 = in.m_46.y;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = fma(_233, 0.072200000286102294921875, _255);
    bool _265 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _267 = 1.0 / _263;
    float _269 = _267 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = _93 * _241;
    float _275 = fma(_271, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _277 = _93 * _247;
    float _279 = _275 * _273;
    float _281 = 0.0 + _123;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = _93 * _253;
    float _287 = _93 * _261;
    float _289 = fma(_233, _279, _277);
    float _291 = fma(_229, _279, _285);
    float _293 = fma(_231, _279, _287);
    float _295 = _277;
    if (!_265)
    {
        _295 = _283;
    }
    float _297 = _295;
    bool _299 = !_265;
    float _301 = _297;
    if (!_299)
    {
        float _303 = in.m_48.w;
        float _305 = gl_FragCoord.w;
        float _307 = _303 * _305;
        float _309 = in.m_48.z;
        float _311 = gl_FragCoord.w;
        float _313 = _309 * _311;
        float _315 = _93 * _307;
        float _317 = _93 * _313;
        float _319 = 1.0 / _315;
        float _321 = _317 * _319;
        float _323 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _325 = fma(_321, (*spvDescriptorSet0.fp_c8)._m0[30].w, _323);
        float _327 = 1.0 / _325;
        float _329 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _331 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _333 = fma(_327, _329, _331);
        float _335 = _333 * 8.0;
        float _337 = precise::clamp(_335, 0.0, 1.0);
        float _339 = _283 * _337;
        _301 = _339;
    }
    float _341 = _301;
    float _343 = 0.0 + _341;
    float _345 = precise::clamp(_343, 0.0, 1.0);
    out.m_44.x = _291;
    out.m_44.y = _293;
    out.m_44.z = _289;
    out.m_44.w = _345;
    return out;
}

