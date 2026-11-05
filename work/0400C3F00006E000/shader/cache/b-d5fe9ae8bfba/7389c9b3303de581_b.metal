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
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
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
    float4 m_33 [[user(locn0)]];
    float4 m_39 [[user(locn1)]];
    float4 m_31 [[user(locn2)]];
    float4 m_48 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_35 [[user(locn5)]];
    float4 m_37 [[user(locn7)]];
    float4 m_46 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_31.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = in.m_31.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = 1.0 / _55;
    float _71 = _69 * _61;
    float _73 = _69 * _67;
    float2 _443 = float2(_71, _73);
    float3 _77 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_443, float2(0.0), isnan(_443))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_443, float2(0.0), isnan(_443))).xyz;
    float _79 = _77.x;
    float _81 = _77.y;
    float _83 = _77.z;
    float _85 = in.m_33.w;
    float _87 = gl_FragCoord.w;
    float _89 = _85 * _87;
    float _91 = in.m_35.w;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_37.w;
    float _99 = gl_FragCoord.w;
    float _101 = _97 * _99;
    float _103 = in.m_33.x;
    float _105 = gl_FragCoord.w;
    float _107 = _103 * _105;
    float _109 = in.m_33.y;
    float _111 = gl_FragCoord.w;
    float _113 = _109 * _111;
    float _115 = in.m_39.x;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = in.m_39.y;
    float _123 = gl_FragCoord.w;
    float _125 = _121 * _123;
    float _127 = in.m_33.z;
    float _129 = gl_FragCoord.w;
    float _131 = _127 * _129;
    float _133 = in.m_39.z;
    float _135 = gl_FragCoord.w;
    float _137 = _133 * _135;
    float _139 = in.m_41.x;
    float _141 = gl_FragCoord.w;
    float _143 = _139 * _141;
    float _145 = in.m_35.x;
    float _147 = gl_FragCoord.w;
    float _149 = _145 * _147;
    float _151 = in.m_35.y;
    float _153 = gl_FragCoord.w;
    float _155 = _151 * _153;
    float _157 = in.m_35.z;
    float _159 = gl_FragCoord.w;
    float _161 = _157 * _159;
    float _163 = _69 * _89;
    float _165 = _69 * _95;
    float _167 = _163 * _165;
    float _169 = precise::clamp(_167, 0.0, 1.0);
    float _171 = _69 * _101;
    float _173 = _69 * _107;
    float _175 = _69 * _113;
    float _177 = _69 * _119;
    float _179 = _69 * _125;
    bool _183 = _171 != 1.0;
    bool _185 = isnan(_171);
    bool _187 = _183 || _185;
    bool _189 = isnan(1.0);
    bool _191 = _187 || _189;
    float _193 = _69 * _131;
    float _195 = _69 * _137;
    float _197 = -_177;
    float _199 = _173 + _197;
    float _201 = -_179;
    float _203 = _175 + _201;
    float _205 = _69 * _143;
    float _207 = -_195;
    float _209 = _193 + _207;
    float _211 = _169 * _205;
    float _213 = fma(_79, _199, _177);
    float _215 = fma(_81, _203, _179);
    float _217 = fma(_83, _209, _195);
    float _219 = _69 * _149;
    float _221 = _69 * _155;
    float _223 = _69 * _161;
    float _225 = _213 * _219;
    float _227 = _215 * _221;
    float _229 = _217 * _223;
    bool _231 = !_191;
    if (!_231)
    {
        float _233 = gl_FragCoord.x;
        float _235 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _237 = _233 / _235;
        float _239 = gl_FragCoord.y;
        float _241 = (*spvDescriptorSet0.support_buffer)._m5[0].x;
        float _243 = _239 / _241;
        float _245 = _171 * 256.0;
        float _247 = trunc(_245);
        int _250 = int(_247);
        float _252 = trunc(_237);
        int _254 = int(_252);
        float _256 = trunc(_243);
        int _258 = int(_256);
        int _260 = _254 + 2;
        int _262 = _260 >> 1;
        uint _265 = uint(int(uint(_258) >> uint(1)));
        int _267 = _262 ^ int(_265);
        int _269 = _267 << 16;
        int _271 = _269 ^ _262;
        int _273 = 983055 & _271;
        int _275 = _273 << 6;
        int _277 = _275 + _273;
        int _279 = _277 & 13369548;
        uint _281 = uint(int(uint(_279) >> uint(3)));
        int _283 = _279 | int(_281);
        uint _285 = uint(int(uint(_250) >> uint(7)));
        int _287 = int(_285) + _250;
        int _289 = _283 & 5570560;
        int _291 = _283 & 85;
        uint _293 = uint(int(uint(_289) >> uint(15)));
        int _295 = int(_293) + _291;
        bool _297 = uint(_287) > uint(_295);
        if (!_297)
        {
            discard_fragment();
        }
        if (!_297)
        {
            out.m_44.x = _225;
            out.m_44.y = _227;
            out.m_44.z = _229;
            out.m_44.w = _211;
            return out;
        }
    }
    float _299 = _227 * 0.715200006961822509765625;
    float _301 = in.m_46.w;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_46.x;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_46.y;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = fma(_225, 0.2125999927520751953125, _299);
    float _321 = in.m_46.z;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = fma(_229, 0.072200000286102294921875, _319);
    bool _329 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _331 = 1.0 / _327;
    float _333 = _331 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _335 = precise::clamp(_333, 0.0, 1.0);
    float _337 = fma(_335, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _339 = _69 * _305;
    float _341 = 0.0 + _211;
    float _343 = precise::clamp(_341, 0.0, 1.0);
    float _345 = _69 * _311;
    float _347 = _337 * _339;
    float _349 = _69 * _317;
    float _351 = _69 * _325;
    float _353 = fma(_225, _347, _345);
    float _355 = fma(_227, _347, _349);
    float _357 = fma(_229, _347, _351);
    float _359 = _345;
    if (!_329)
    {
        _359 = _343;
    }
    float _361 = _359;
    bool _363 = !_329;
    float _365 = _361;
    if (!_363)
    {
        float _367 = in.m_48.w;
        float _369 = gl_FragCoord.w;
        float _371 = _367 * _369;
        float _373 = in.m_48.z;
        float _375 = gl_FragCoord.w;
        float _377 = _373 * _375;
        float _379 = _69 * _371;
        float _381 = _69 * _377;
        float _383 = 1.0 / _379;
        float _385 = _381 * _383;
        float _387 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _389 = fma(_385, (*spvDescriptorSet0.fp_c8)._m0[30].w, _387);
        float _391 = 1.0 / _389;
        float _393 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _395 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _397 = fma(_391, _393, _395);
        float _399 = _397 * 8.0;
        float _401 = precise::clamp(_399, 0.0, 1.0);
        float _403 = _343 * _401;
        _365 = _403;
    }
    float _405 = _365;
    float _407 = 0.0 + _405;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    out.m_44.x = _353;
    out.m_44.y = _355;
    out.m_44.z = _357;
    out.m_44.w = _409;
    return out;
}

