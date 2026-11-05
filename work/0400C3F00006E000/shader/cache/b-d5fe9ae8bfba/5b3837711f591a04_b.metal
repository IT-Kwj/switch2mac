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
    float4 m_41 [[user(locn1)]];
    float4 m_33 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
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
    float2 _392;
    _392.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    _392.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_71, _73));
    float _75 = _392.x;
    float _77 = _75 * 256.0;
    int _80 = int(_77);
    float _82 = float(uint(_80));
    float _84 = _82 * 0.00390625;
    float _86 = precise::min(_84, 2.0);
    float2 _412 = float2(_71, _73);
    float4 _89 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_412, float2(0.0), isnan(_412)), level(_86)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_412, float2(0.0), isnan(_412)), level(_86)).xyzw;
    float _91 = _89.x;
    float _93 = _89.y;
    float _95 = _89.z;
    float _97 = _89.w;
    float _99 = in.m_35.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_37.w;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_39.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _69 * _103;
    float _119 = _69 * _109;
    float _121 = in.m_37.x;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_41.x;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_37.y;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.y;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_41.z;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_35.x;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_35.y;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = in.m_35.z;
    float _165 = gl_FragCoord.w;
    float _167 = _163 * _165;
    float _169 = _69 * _125;
    float _171 = _69 * _137;
    float _173 = _69 * _149;
    float _175 = _97 * _117;
    float _177 = _69 * _115;
    float _179 = _119 * _175;
    float _181 = 0.0 + _179;
    float _183 = precise::clamp(_181, 0.0, 1.0);
    float _185 = _183 * _177;
    bool _189 = _185 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _191 = isnan(_185);
    bool _193 = _189 || _191;
    bool _195 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _197 = _193 || _195;
    float _199 = in.m_37.z;
    float _201 = gl_FragCoord.w;
    float _203 = _199 * _201;
    if (!_197)
    {
        discard_fragment();
    }
    float _205 = _69 * _131;
    float _207 = _69 * _143;
    float _209 = _91 * _91;
    float _211 = _93 * _93;
    float _213 = -_205;
    float _215 = _169 + _213;
    float _217 = -_207;
    float _219 = _171 + _217;
    float _221 = _95 * _95;
    float _223 = fma(_209, _215, _205);
    float _225 = fma(_211, _219, _207);
    float _227 = _69 * _155;
    float _229 = _69 * _161;
    float _231 = _69 * _167;
    float _233 = _223 * _227;
    float _235 = _69 * _203;
    float _237 = _225 * _229;
    float _239 = -_173;
    float _241 = _235 + _239;
    float _243 = fma(_221, _241, _173);
    float _245 = _243 * _231;
    if (!_197)
    {
        out.m_44.x = _233;
        out.m_44.y = _237;
        out.m_44.z = _245;
        out.m_44.w = _179;
        return out;
    }
    float _247 = _237 * 0.715200006961822509765625;
    float _249 = in.m_46.w;
    float _251 = gl_FragCoord.w;
    float _253 = _249 * _251;
    float _255 = in.m_46.z;
    float _257 = gl_FragCoord.w;
    float _259 = _255 * _257;
    float _261 = in.m_46.x;
    float _263 = gl_FragCoord.w;
    float _265 = _261 * _263;
    float _267 = fma(_233, 0.2125999927520751953125, _247);
    float _269 = in.m_46.y;
    float _271 = gl_FragCoord.w;
    float _273 = _269 * _271;
    float _275 = fma(_245, 0.072200000286102294921875, _267);
    bool _277 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _279 = 1.0 / _275;
    float _281 = _279 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _283 = precise::clamp(_281, 0.0, 1.0);
    float _285 = fma(_283, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _287 = _69 * _253;
    float _289 = _69 * _259;
    float _291 = _285 * _287;
    float _293 = 0.0 + _185;
    float _295 = precise::clamp(_293, 0.0, 1.0);
    float _297 = _69 * _265;
    float _299 = _69 * _273;
    float _301 = fma(_245, _291, _289);
    float _303 = fma(_233, _291, _297);
    float _305 = fma(_237, _291, _299);
    float _307 = _289;
    if (!_277)
    {
        _307 = _295;
    }
    float _309 = _307;
    bool _311 = !_277;
    float _313 = _309;
    if (!_311)
    {
        float _315 = in.m_48.w;
        float _317 = gl_FragCoord.w;
        float _319 = _315 * _317;
        float _321 = in.m_48.z;
        float _323 = gl_FragCoord.w;
        float _325 = _321 * _323;
        float _327 = _69 * _319;
        float _329 = _69 * _325;
        float _331 = 1.0 / _327;
        float _333 = _329 * _331;
        float _335 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _337 = fma(_333, (*spvDescriptorSet0.fp_c8)._m0[30].w, _335);
        float _339 = 1.0 / _337;
        float _341 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _343 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _345 = fma(_339, _341, _343);
        float _347 = _345 * 8.0;
        float _349 = precise::clamp(_347, 0.0, 1.0);
        float _351 = _295 * _349;
        _313 = _351;
    }
    float _353 = _313;
    float _355 = 0.0 + _353;
    float _357 = precise::clamp(_355, 0.0, 1.0);
    out.m_44.x = _303;
    out.m_44.y = _305;
    out.m_44.z = _301;
    out.m_44.w = _357;
    return out;
}

