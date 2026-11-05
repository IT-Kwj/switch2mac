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
    constant _16* fp_c10 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    sampler fp_t_tcb_8Smplr_w [[id(6)]];
    constant dm_border_t* dm_border [[id(7)]];
};

struct main0_out
{
    float4 m_44 [[color(0)]];
};

struct main0_in
{
    float4 m_41 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_37 [[user(locn3)]];
    float4 m_35 [[user(locn4)]];
    float4 m_46 [[user(locn6)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_35.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_35.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _376;
    _376.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    _376.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    float _75 = _376.x;
    float _77 = _75 * 256.0;
    int _80 = int(_77);
    float _82 = float(uint(_80));
    float _84 = _82 * 0.00390625;
    float _86 = precise::min(_84, 2.0);
    float2 _396 = float2(_71, _73);
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_396, float2(0.0), isnan(_396)), level(_86)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_396, float2(0.0), isnan(_396)), level(_86)).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = (*spvDescriptorSet0.fp_c8)._m0[28].y * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _101 = fma((*spvDescriptorSet0.fp_c8)._m0[28].x, (*spvDescriptorSet0.fp_c8)._m0[28].x, _99);
    float _103 = fma((*spvDescriptorSet0.fp_c8)._m0[28].z, (*spvDescriptorSet0.fp_c8)._m0[28].z, _101);
    float _105 = rsqrt(_103);
    float _107 = _105 * (*spvDescriptorSet0.fp_c8)._m0[28].y;
    float _109 = _105 * (*spvDescriptorSet0.fp_c8)._m0[28].x;
    float _111 = _107 * (*spvDescriptorSet0.fp_c10)._m0[9].z;
    float _113 = _105 * (*spvDescriptorSet0.fp_c8)._m0[28].z;
    float _115 = in.m_37.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = fma(_109, (*spvDescriptorSet0.fp_c10)._m0[8].z, _111);
    float _123 = fma(_113, (*spvDescriptorSet0.fp_c10)._m0[10].z, _121);
    float _125 = fma(_123, 0.5, 0.5);
    float _127 = precise::max(0.0, _125);
    float _129 = precise::min(_127, 0.5);
    float _131 = _129 * 2.0;
    float _133 = _131 * _131;
    float _135 = _69 * _119;
    float _137 = in.m_39.z;
    float _139 = gl_FragCoord.w;
    float _141 = _137 * _139;
    float _143 = in.m_39.x;
    float _145 = gl_FragCoord.w;
    float _147 = _143 * _145;
    float _149 = in.m_41.x;
    float _151 = gl_FragCoord.w;
    float _153 = _149 * _151;
    float _155 = in.m_41.y;
    float _157 = gl_FragCoord.w;
    float _159 = _155 * _157;
    float _161 = in.m_41.z;
    float _163 = gl_FragCoord.w;
    float _165 = _161 * _163;
    float _167 = _69 * _147;
    float _169 = _97 * _133;
    float _171 = 0.0 + _169;
    float _173 = precise::clamp(_171, 0.0, 1.0);
    float _175 = _173 * _135;
    bool _179 = _175 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _181 = isnan(_175);
    bool _183 = _179 || _181;
    bool _185 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _187 = _183 || _185;
    float _189 = in.m_39.y;
    float _191 = gl_FragCoord.w;
    float _193 = _189 * _191;
    if (!_187)
    {
        discard_fragment();
    }
    float _195 = _91 * _91;
    float _197 = _95 * _95;
    float _199 = _69 * _141;
    float _201 = -_195;
    float _203 = _201 + 1.0;
    float _205 = -_197;
    float _207 = _205 + 1.0;
    float _209 = _167 * _203;
    float _211 = _199 * _207;
    float _213 = _69 * _159;
    float _215 = _69 * _165;
    float _217 = _69 * _193;
    float _219 = _93 * _93;
    float _221 = fma(_197, _215, _211);
    float _223 = -_219;
    float _225 = _223 + 1.0;
    float _227 = _217 * _225;
    float _229 = _69 * _153;
    float _231 = fma(_219, _213, _227);
    float _233 = fma(_195, _229, _209);
    if (!_187)
    {
        out.m_44.x = _233;
        out.m_44.y = _231;
        out.m_44.z = _221;
        out.m_44.w = _169;
        return out;
    }
    float _235 = _231 * 0.715200006961822509765625;
    float _237 = in.m_46.w;
    float _239 = gl_FragCoord.w;
    float _241 = _237 * _239;
    float _243 = in.m_46.x;
    float _245 = gl_FragCoord.w;
    float _247 = _243 * _245;
    float _249 = in.m_46.y;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = fma(_233, 0.2125999927520751953125, _235);
    float _257 = in.m_46.z;
    float _259 = gl_FragCoord.w;
    float _261 = _257 * _259;
    float _263 = fma(_221, 0.072200000286102294921875, _255);
    bool _265 = 0.5 <= (*spvDescriptorSet0.fp_c15)._m0[653].w;
    float _267 = 1.0 / _263;
    float _269 = _267 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _271 = precise::clamp(_269, 0.0, 1.0);
    float _273 = 0.0 + _175;
    float _275 = precise::clamp(_273, 0.0, 1.0);
    float _277 = _69 * _241;
    float _279 = fma(_271, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _281 = _279 * _277;
    float _283 = _69 * _247;
    float _285 = _69 * _253;
    float _287 = _69 * _261;
    float _289 = fma(_233, _281, _283);
    float _291 = fma(_231, _281, _285);
    float _293 = fma(_221, _281, _287);
    bool _295 = !_265;
    float _297 = _275;
    if (!_295)
    {
        float _299 = in.m_48.w;
        float _301 = gl_FragCoord.w;
        float _303 = _299 * _301;
        float _305 = in.m_48.z;
        float _307 = gl_FragCoord.w;
        float _309 = _305 * _307;
        float _311 = _69 * _303;
        float _313 = _69 * _309;
        float _315 = 1.0 / _311;
        float _317 = _313 * _315;
        float _319 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _321 = fma(_317, (*spvDescriptorSet0.fp_c8)._m0[30].w, _319);
        float _323 = 1.0 / _321;
        float _325 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _327 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _329 = fma(_323, _325, _327);
        float _331 = _329 * 8.0;
        float _333 = precise::clamp(_331, 0.0, 1.0);
        float _335 = _275 * _333;
        _297 = _335;
    }
    float _337 = _297;
    float _339 = 0.0 + _337;
    float _341 = precise::clamp(_339, 0.0, 1.0);
    out.m_44.x = _289;
    out.m_44.y = _291;
    out.m_44.z = _293;
    out.m_44.w = _341;
    return out;
}

