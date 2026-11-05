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
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_8 [[id(3)]];
    sampler fp_t_tcb_8Smplr [[id(4)]];
    texture2d<float> fp_t_tcb_10 [[id(5)]];
    sampler fp_t_tcb_10Smplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_10Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_47 [[user(locn2)]];
    float4 m_43 [[user(locn3)]];
    float4 m_41 [[user(locn4), flat]];
    float4 m_37 [[user(locn5)]];
    float4 m_39 [[user(locn6)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_37.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.y;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = 1.0 / _61;
    float _77 = _75 * _67;
    float _79 = _75 * _73;
    float2 _465 = float2(_77, _79);
    float2 _83 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_465, float2(0.0), isnan(_465))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_465, float2(0.0), isnan(_465))).xy;
    float _85 = _83.x;
    float _87 = _83.y;
    float _89 = in.m_39.w;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_39.x;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_39.y;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_37.z;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = in.m_41.x;
    float _115 = in.m_37.w;
    float _117 = gl_FragCoord.w;
    float _119 = _115 * _117;
    float _121 = _75 * _93;
    float _123 = _75 * _99;
    float _125 = _75 * _105;
    float _127 = 1.0 / _121;
    float _129 = _75 * _111;
    float _131 = _113 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _133 = _113 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _135 = _75 * _119;
    float _137 = _123 * _127;
    float _139 = _125 * _127;
    float _141 = fma(_131, _85, _129);
    float _143 = fma(_133, _87, _135);
    float2 _560 = float2(_137, _139);
    float _145 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_560, float2(0.0), isnan(_560))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_560, float2(0.0), isnan(_560))).x;
    float2 _568 = float2(_141, _143);
    float4 _148 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_568, float2(0.0), isnan(_568))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_568, float2(0.0), isnan(_568))).xyzw;
    float _150 = _148.x;
    float _152 = _148.y;
    float _154 = _148.z;
    float _156 = _148.w;
    float _158 = in.m_39.z;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = in.m_43.w;
    float _166 = gl_FragCoord.w;
    float _168 = _164 * _166;
    float _170 = in.m_45.w;
    float _172 = gl_FragCoord.w;
    float _174 = _170 * _172;
    float _176 = in.m_47.x;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = 1.0 / (*spvDescriptorSet0.fp_c9)._m0[142].y;
    float _184 = _75 * _162;
    float _186 = _184 * _127;
    float _188 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _190 = fma(_186, (*spvDescriptorSet0.fp_c8)._m0[30].w, _188);
    float _192 = _75 * _168;
    float _194 = 1.0 / _190;
    float _196 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _198 = _194 * _196;
    float _200 = in.m_49.y;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = in.m_43.x;
    float _208 = gl_FragCoord.w;
    float _210 = _206 * _208;
    float _212 = in.m_43.y;
    float _214 = gl_FragCoord.w;
    float _216 = _212 * _214;
    float _218 = in.m_43.z;
    float _220 = gl_FragCoord.w;
    float _222 = _218 * _220;
    float _224 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
    float _226 = fma(_145, (*spvDescriptorSet0.fp_c8)._m0[30].w, _224);
    float _228 = _75 * _174;
    float _230 = 1.0 / _226;
    float _232 = _156 * _192;
    float _234 = _228 * _232;
    float _236 = 0.0 + _234;
    float _238 = precise::clamp(_236, 0.0, 1.0);
    float _240 = _75 * _180;
    float _242 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
    float _244 = -_198;
    float _246 = fma(_230, _242, _244);
    float _248 = _246 * _182;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = abs(_246);
    bool _256 = _252 < (*spvDescriptorSet0.fp_c9)._m0[141].x;
    float _258 = float(_256);
    float _260 = _238 * _250;
    float _262 = _260 * _258;
    float _264 = _262 * _240;
    bool _266 = _264 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _268 = isnan(_264);
    bool _270 = _266 || _268;
    bool _272 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _274 = _270 || _272;
    float _276 = in.m_49.x;
    float _278 = gl_FragCoord.w;
    float _280 = _276 * _278;
    float _282 = in.m_45.x;
    float _284 = gl_FragCoord.w;
    float _286 = _282 * _284;
    float _288 = in.m_45.y;
    float _290 = gl_FragCoord.w;
    float _292 = _288 * _290;
    float _294 = in.m_45.z;
    float _296 = gl_FragCoord.w;
    float _298 = _294 * _296;
    float _300 = in.m_49.z;
    float _302 = gl_FragCoord.w;
    float _304 = _300 * _302;
    if (!_274)
    {
        discard_fragment();
    }
    float _306 = _75 * _280;
    float _308 = _75 * _286;
    float _310 = _75 * _292;
    float _312 = _75 * _204;
    float _314 = _75 * _298;
    float _316 = _75 * _304;
    float _318 = -_306;
    float _320 = _308 + _318;
    float _322 = -_312;
    float _324 = _310 + _322;
    float _326 = -_316;
    float _328 = _314 + _326;
    float _330 = fma(_150, _320, _306);
    float _332 = fma(_152, _324, _312);
    float _334 = _75 * _210;
    float _336 = fma(_154, _328, _316);
    float _338 = _75 * _216;
    float _340 = _75 * _222;
    float _342 = _330 * _334;
    float _344 = _332 * _338;
    float _346 = _336 * _340;
    if (!_274)
    {
        out.m_52.x = _342;
        out.m_52.y = _344;
        out.m_52.z = _346;
        out.m_52.w = _234;
        return out;
    }
    float _348 = _344 * 0.715200006961822509765625;
    float _350 = in.m_54.w;
    float _352 = gl_FragCoord.w;
    float _354 = _350 * _352;
    float _356 = in.m_54.x;
    float _358 = gl_FragCoord.w;
    float _360 = _356 * _358;
    float _362 = in.m_54.y;
    float _364 = gl_FragCoord.w;
    float _366 = _362 * _364;
    float _368 = fma(_342, 0.2125999927520751953125, _348);
    float _370 = in.m_54.z;
    float _372 = gl_FragCoord.w;
    float _374 = _370 * _372;
    float _376 = fma(_346, 0.072200000286102294921875, _368);
    bool _378 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _380 = 1.0 / _376;
    float _382 = (*spvDescriptorSet0.fp_c15)._m0[653].w;
    if (_378)
    {
        float _384 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _386 = _198 + _384;
        _382 = _386;
    }
    float _388 = _382;
    float _390 = _380 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _392 = precise::clamp(_390, 0.0, 1.0);
    float _394 = fma(_392, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _396 = _75 * _354;
    float _398 = _75 * _366;
    float _400 = _394 * _396;
    float _402 = 0.0 + _264;
    float _404 = precise::clamp(_402, 0.0, 1.0);
    float _406 = _396;
    float _408 = _404;
    if (_378)
    {
        float _410 = _388 * 8.0;
        float _412 = precise::clamp(_410, 0.0, 1.0);
        _406 = _412;
    }
    float _414 = _406;
    float _416 = _75 * _360;
    float _418 = _75 * _374;
    float _420 = fma(_344, _400, _398);
    if (_378)
    {
        float _422 = _404 * _414;
        _408 = _422;
    }
    float _424 = _408;
    float _426 = fma(_342, _400, _416);
    float _428 = fma(_346, _400, _418);
    float _430 = 0.0 + _424;
    float _432 = precise::clamp(_430, 0.0, 1.0);
    out.m_52.x = _426;
    out.m_52.y = _420;
    out.m_52.z = _428;
    out.m_52.w = _432;
    return out;
}

