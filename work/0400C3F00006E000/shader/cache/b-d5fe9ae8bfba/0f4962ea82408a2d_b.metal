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
    texture2d<float> fp_t_tcb_A [[id(5)]];
    sampler fp_t_tcb_ASmplr [[id(6)]];
    sampler fp_t_tcb_8Smplr_w [[id(7)]];
    sampler fp_t_tcb_ASmplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_33 [[user(locn2), flat]];
    float4 m_50 [[user(locn3)]];
    float4 m_41 [[user(locn4)]];
    float4 m_37 [[user(locn5)]];
    float4 m_48 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _57 = in.m_33.x;
    float _59 = gl_FragCoord.w;
    float _61 = in.m_33.y;
    float _63 = in.m_37.y;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _57;
    float _77 = 1.0 / _59;
    float _79 = _61 * _75;
    float _81 = _77 * _67;
    float _83 = _81 * _79;
    float _85 = precise::max(0.0, _83);
    float _87 = _77 * _73;
    float _89 = precise::min(_85, 0.5);
    float2 _463;
    _463.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_87, _89));
    _463.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_87, _89));
    float _91 = _463.x;
    float _93 = _91 * 256.0;
    int _96 = int(_93);
    float _98 = in.m_37.z;
    float _100 = gl_FragCoord.w;
    float _102 = _98 * _100;
    float _104 = in.m_37.w;
    float _106 = gl_FragCoord.w;
    float _108 = _104 * _106;
    float _110 = _77 * _102;
    float _112 = _77 * _108;
    float2 _494 = float2(_110, _112);
    float4 _115 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_494, float2(0.0), isnan(_494))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_494, float2(0.0), isnan(_494))).xyzw;
    float _117 = _115.x;
    float _119 = _115.y;
    float _121 = _115.z;
    float _123 = _115.w;
    float _125 = float(uint(_96));
    float _127 = _125 * 0.00390625;
    float _129 = precise::min(_127, 2.0);
    float2 _521 = float2(_87, _89);
    float4 _131 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_521, float2(0.0), isnan(_521)), level(_129)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_521, float2(0.0), isnan(_521)), level(_129)).xyzw;
    float _133 = _131.x;
    float _135 = _131.y;
    float _137 = _131.z;
    float _139 = _131.w;
    float _141 = in.m_39.w;
    float _143 = gl_FragCoord.w;
    float _145 = _141 * _143;
    float _147 = in.m_41.x;
    float _149 = gl_FragCoord.w;
    float _151 = _147 * _149;
    float _153 = abs(_123);
    float _155 = log2(_153);
    float _157 = _77 * _145;
    float _159 = _77 * _151;
    float _161 = _155 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _163 = exp2(_161);
    float _165 = _117 * _117;
    float _167 = _121 * _121;
    float _169 = _119 * _119;
    float _171 = abs(_165);
    float _173 = log2(_171);
    float _175 = abs(_167);
    float _177 = log2(_175);
    float _179 = abs(_169);
    float _181 = log2(_179);
    float _183 = in.m_43.z;
    float _185 = gl_FragCoord.w;
    float _187 = _183 * _185;
    float _189 = _173 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _191 = in.m_39.y;
    float _193 = gl_FragCoord.w;
    float _195 = _191 * _193;
    float _197 = in.m_39.x;
    float _199 = gl_FragCoord.w;
    float _201 = _197 * _199;
    float _203 = _177 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _205 = in.m_39.z;
    float _207 = gl_FragCoord.w;
    float _209 = _205 * _207;
    float _211 = exp2(_189);
    float _213 = _181 * (*spvDescriptorSet0.fp_c9)._m0[194].w;
    float _215 = exp2(_203);
    float _217 = exp2(_213);
    float _219 = _139 * _163;
    float _221 = _157 * _219;
    float _223 = precise::clamp(_221, 0.0, 1.0);
    float _225 = _223 * _159;
    bool _229 = _225 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _231 = isnan(_225);
    bool _233 = _229 || _231;
    bool _235 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _237 = _233 || _235;
    if (!_237)
    {
        discard_fragment();
    }
    float _239 = in.m_43.x;
    float _241 = gl_FragCoord.w;
    float _243 = _239 * _241;
    float _245 = in.m_43.y;
    float _247 = gl_FragCoord.w;
    float _249 = _245 * _247;
    float _251 = _133 * _133;
    float _253 = _135 * _135;
    float _255 = _137 * _137;
    float _257 = _251 * _211;
    float _259 = _253 * _217;
    float _261 = _255 * _215;
    float _263 = -_257;
    float _265 = _263 + 1.0;
    float _267 = -_259;
    float _269 = _267 + 1.0;
    float _271 = -_261;
    float _273 = _271 + 1.0;
    float _275 = _77 * _243;
    float _277 = _77 * _249;
    float _279 = _77 * _187;
    float _281 = _275 * _265;
    float _283 = _277 * _269;
    float _285 = _279 * _273;
    float _287 = _77 * _201;
    float _289 = _77 * _195;
    float _291 = _77 * _209;
    float _293 = fma(_257, _287, _281);
    float _295 = fma(_259, _289, _283);
    float _297 = fma(_261, _291, _285);
    if (!_237)
    {
        out.m_46.x = _293;
        out.m_46.y = _295;
        out.m_46.z = _297;
        out.m_46.w = _223;
        return out;
    }
    float _299 = _295 * 0.715200006961822509765625;
    float _301 = in.m_48.w;
    float _303 = gl_FragCoord.w;
    float _305 = _301 * _303;
    float _307 = in.m_48.z;
    float _309 = gl_FragCoord.w;
    float _311 = _307 * _309;
    float _313 = in.m_48.x;
    float _315 = gl_FragCoord.w;
    float _317 = _313 * _315;
    float _319 = fma(_293, 0.2125999927520751953125, _299);
    float _321 = in.m_48.y;
    float _323 = gl_FragCoord.w;
    float _325 = _321 * _323;
    float _327 = 0.0 + _225;
    float _329 = precise::clamp(_327, 0.0, 1.0);
    float _331 = fma(_297, 0.072200000286102294921875, _319);
    bool _333 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _335 = 1.0 / _331;
    float _337 = _335 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _339 = precise::clamp(_337, 0.0, 1.0);
    float _341 = fma(_339, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _343 = _77 * _305;
    float _345 = _77 * _311;
    float _347 = _341 * _343;
    float _349 = _77 * _317;
    float _351 = _77 * _325;
    float _353 = fma(_297, _347, _345);
    float _355 = fma(_293, _347, _349);
    float _357 = fma(_295, _347, _351);
    float _359 = _345;
    if (!_333)
    {
        _359 = _329;
    }
    float _361 = _359;
    bool _363 = !_333;
    float _365 = _361;
    if (!_363)
    {
        float _367 = in.m_50.w;
        float _369 = gl_FragCoord.w;
        float _371 = _367 * _369;
        float _373 = in.m_50.z;
        float _375 = gl_FragCoord.w;
        float _377 = _373 * _375;
        float _379 = _77 * _371;
        float _381 = _77 * _377;
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
        float _403 = _329 * _401;
        _365 = _403;
    }
    float _405 = _365;
    float _407 = 0.0 + _405;
    float _409 = precise::clamp(_407, 0.0, 1.0);
    out.m_46.x = _355;
    out.m_46.y = _357;
    out.m_46.z = _353;
    out.m_46.w = _409;
    return out;
}

