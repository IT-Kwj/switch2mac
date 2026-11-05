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

struct spvDescriptorSetBuffer0
{
    texture2d<float> fp_t_tcb_8 [[id(0)]];
    sampler fp_t_tcb_8Smplr [[id(1)]];
    sampler fp_t_tcb_8Smplr_w [[id(2)]];
    constant dm_border_t* dm_border [[id(3)]];
};

struct main0_out
{
    float4 m_28 [[color(0)]];
};

struct main0_in
{
    float4 m_25 [[user(locn0)]];
    float4 m_23 [[user(locn1)]];
    float4 m_30 [[user(locn2)]];
    float4 m_32 [[user(locn3)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _39 = gl_FragCoord.w;
    float _41 = in.m_23.x;
    float _43 = gl_FragCoord.w;
    float _45 = _41 * _43;
    float _47 = in.m_25.x;
    float _49 = gl_FragCoord.w;
    float _51 = _47 * _49;
    float _53 = in.m_23.y;
    float _55 = gl_FragCoord.w;
    float _57 = _53 * _55;
    float _59 = in.m_25.y;
    float _61 = gl_FragCoord.w;
    float _63 = _59 * _61;
    float _65 = in.m_23.z;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_23.w;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _39;
    float _79 = _77 * _45;
    float _81 = _77 * _51;
    float _83 = _77 * _57;
    float _85 = _77 * _63;
    float _87 = _77 * _69;
    float _89 = _77 * _75;
    float2 _540 = float2(_81, _85);
    float3 _93 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_540, float2(0.0), isnan(_540))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_540, float2(0.0), isnan(_540))).xyz;
    float _95 = _93.x;
    float _97 = _93.y;
    float _99 = _93.z;
    float2 _557 = float2(_79, _83);
    float3 _101 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_557, float2(0.0), isnan(_557))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_557, float2(0.0), isnan(_557))).xyz;
    float _103 = _101.x;
    float _105 = _101.y;
    float _107 = _101.z;
    float2 _571 = float2(_87, _89);
    float3 _109 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_571, float2(0.0), isnan(_571))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_571, float2(0.0), isnan(_571))).xyz;
    float _111 = _109.x;
    float _113 = _109.y;
    float _115 = _109.z;
    float _117 = sqrt(_95);
    float _119 = sqrt(_97);
    float _121 = sqrt(_103);
    float _123 = sqrt(_105);
    float _125 = sqrt(_111);
    float _127 = -_121;
    float _129 = _117 + _127;
    float _131 = sqrt(_113);
    float _133 = -_123;
    float _135 = _119 + _133;
    float _137 = abs(_129);
    float _139 = abs(_135);
    float _141 = precise::max(_137, _139);
    float _143 = sqrt(_99);
    float _145 = -_125;
    float _147 = _117 + _145;
    float _149 = sqrt(_107);
    float _151 = -_131;
    float _153 = _119 + _151;
    float _155 = abs(_147);
    float _157 = abs(_153);
    float _159 = precise::max(_155, _157);
    float _161 = sqrt(_115);
    float _163 = -_149;
    float _165 = _143 + _163;
    float _167 = abs(_165);
    float _169 = precise::max(_167, _141);
    float _171 = -_161;
    float _173 = _143 + _171;
    bool _177 = _169 >= 0.100000001490116119384765625;
    bool _179 = isnan(_169);
    bool _181 = _177 || _179;
    bool _183 = isnan(0.100000001490116119384765625);
    bool _185 = _181 || _183;
    float _187 = float(_185);
    float _189 = abs(_173);
    float _191 = precise::max(_189, _159);
    bool _193 = _191 >= 0.100000001490116119384765625;
    bool _195 = isnan(_191);
    bool _197 = _193 || _195;
    bool _199 = isnan(0.100000001490116119384765625);
    bool _201 = _197 || _199;
    float _203 = float(_201);
    float _205 = -_203;
    bool _207 = _187 != _205;
    bool _209 = isnan(_187);
    bool _211 = _207 || _209;
    bool _213 = isnan(_205);
    bool _215 = _211 || _213;
    if (!_215)
    {
        discard_fragment();
    }
    if (!_215)
    {
        out.m_28.x = 0.0;
        out.m_28.y = 0.0;
        out.m_28.z = 0.0;
        out.m_28.w = 0.0;
        return out;
    }
    float _217 = in.m_30.x;
    float _219 = gl_FragCoord.w;
    float _221 = _217 * _219;
    float _223 = in.m_30.y;
    float _225 = gl_FragCoord.w;
    float _227 = _223 * _225;
    float _229 = in.m_32.x;
    float _231 = gl_FragCoord.w;
    float _233 = _229 * _231;
    float _235 = in.m_32.y;
    float _237 = gl_FragCoord.w;
    float _239 = _235 * _237;
    float _241 = in.m_30.z;
    float _243 = gl_FragCoord.w;
    float _245 = _241 * _243;
    float _247 = in.m_30.w;
    float _249 = gl_FragCoord.w;
    float _251 = _247 * _249;
    float _253 = in.m_32.z;
    float _255 = gl_FragCoord.w;
    float _257 = _253 * _255;
    float _259 = in.m_32.w;
    float _261 = gl_FragCoord.w;
    float _263 = _259 * _261;
    float _265 = _77 * _221;
    float _267 = _77 * _227;
    float _269 = _77 * _233;
    float _271 = _77 * _239;
    float _273 = _77 * _245;
    float _275 = _77 * _251;
    float _277 = _77 * _257;
    float _279 = _77 * _263;
    float2 _793 = float2(_265, _267);
    float3 _281 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_793, float2(0.0), isnan(_793))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_793, float2(0.0), isnan(_793))).xyz;
    float _283 = _281.x;
    float _285 = _281.y;
    float _287 = _281.z;
    float2 _807 = float2(_269, _271);
    float3 _289 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_807, float2(0.0), isnan(_807))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_807, float2(0.0), isnan(_807))).xyz;
    float _291 = _289.x;
    float _293 = _289.y;
    float _295 = _289.z;
    float2 _821 = float2(_273, _275);
    float3 _297 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_821, float2(0.0), isnan(_821))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_821, float2(0.0), isnan(_821))).xyz;
    float _299 = _297.x;
    float _301 = _297.y;
    float _303 = _297.z;
    float2 _835 = float2(_277, _279);
    float3 _305 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_835, float2(0.0), isnan(_835))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_835, float2(0.0), isnan(_835))).xyz;
    float _307 = _305.x;
    float _309 = _305.y;
    float _311 = _305.z;
    float _313 = sqrt(_283);
    float _315 = sqrt(_285);
    float _317 = sqrt(_299);
    float _319 = -_313;
    float _321 = _117 + _319;
    float _323 = sqrt(_301);
    float _325 = -_315;
    float _327 = _119 + _325;
    float _329 = abs(_321);
    float _331 = abs(_327);
    float _333 = precise::max(_329, _331);
    float _335 = sqrt(_287);
    float _337 = -_317;
    float _339 = _117 + _337;
    float _341 = sqrt(_291);
    float _343 = -_323;
    float _345 = _119 + _343;
    float _347 = abs(_339);
    float _349 = abs(_345);
    float _351 = precise::max(_347, _349);
    float _353 = sqrt(_293);
    float _355 = -_335;
    float _357 = _143 + _355;
    float _359 = _191 * 2.0;
    float _361 = abs(_357);
    float _363 = precise::max(_361, _333);
    float _365 = sqrt(_303);
    float _367 = -_341;
    float _369 = _117 + _367;
    float _371 = precise::max(_169, _363);
    float _373 = _169 * 2.0;
    float _375 = sqrt(_307);
    float _377 = -_353;
    float _379 = _119 + _377;
    float _381 = abs(_369);
    float _383 = abs(_379);
    float _385 = precise::max(_381, _383);
    float _387 = sqrt(_309);
    float _389 = -_365;
    float _391 = _143 + _389;
    float _393 = abs(_391);
    float _395 = precise::max(_393, _351);
    float _397 = sqrt(_295);
    float _399 = -_375;
    float _401 = _117 + _399;
    float _403 = precise::max(_191, _395);
    float _405 = sqrt(_311);
    float _407 = -_387;
    float _409 = _119 + _407;
    float _411 = abs(_401);
    float _413 = abs(_409);
    float _415 = precise::max(_411, _413);
    float _417 = -_397;
    float _419 = _143 + _417;
    float _421 = abs(_419);
    float _423 = precise::max(_421, _385);
    float _425 = -_405;
    float _427 = _143 + _425;
    float _429 = precise::max(_371, _423);
    float _431 = abs(_427);
    float _433 = precise::max(_431, _415);
    float _435 = precise::max(_403, _433);
    float _437 = precise::max(_429, _435);
    bool _439 = _373 >= _437;
    bool _441 = isnan(_373);
    bool _443 = _439 || _441;
    bool _445 = isnan(_437);
    bool _447 = _443 || _445;
    float _449 = float(_447);
    bool _451 = _359 >= _437;
    bool _453 = isnan(_359);
    bool _455 = _451 || _453;
    bool _457 = isnan(_437);
    bool _459 = _455 || _457;
    float _461 = float(_459);
    float _463 = _187 * _449;
    float _465 = _203 * _461;
    out.m_28.x = _463;
    out.m_28.y = _465;
    out.m_28.z = 0.0;
    out.m_28.w = 0.0;
    return out;
}

