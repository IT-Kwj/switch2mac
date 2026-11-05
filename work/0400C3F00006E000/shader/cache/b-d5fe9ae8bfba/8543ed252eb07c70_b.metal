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
    texture2d<float> fp_t_tcb_C [[id(7)]];
    sampler fp_t_tcb_CSmplr [[id(8)]];
    texture2d<float> fp_t_tcb_34 [[id(9)]];
    sampler fp_t_tcb_34Smplr [[id(10)]];
    sampler fp_t_tcb_8Smplr_w [[id(11)]];
    sampler fp_t_tcb_ASmplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_34Smplr_w [[id(14)]];
    constant dm_border_t* dm_border [[id(15)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_56 [[user(locn2)]];
    float4 m_49 [[user(locn3)]];
    float4 m_39 [[user(locn4)]];
    float4 m_41 [[user(locn5)]];
    float4 m_43 [[user(locn6)]];
    float4 m_54 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_39.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_39.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = in.m_39.z;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = in.m_39.w;
    float _85 = gl_FragCoord.w;
    float _87 = _83 * _85;
    float _89 = in.m_41.x;
    float _91 = gl_FragCoord.w;
    float _93 = _89 * _91;
    float _95 = in.m_41.y;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_43.x;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = in.m_43.y;
    float _109 = gl_FragCoord.w;
    float _111 = _107 * _109;
    float _113 = 1.0 / _63;
    float _115 = _113 * _69;
    float _117 = _113 * _75;
    float _119 = _113 * _81;
    float _121 = _113 * _87;
    float _123 = _113 * _93;
    float _125 = _113 * _99;
    float _127 = _113 * _105;
    float _129 = _113 * _111;
    float2 _513 = float2(_115, _117);
    float4 _132 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_513, float2(0.0), isnan(_513))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_513, float2(0.0), isnan(_513))).xyzw;
    float _134 = _132.x;
    float _136 = _132.y;
    float _138 = _132.z;
    float _140 = _132.w;
    float2 _532 = float2(_119, _121);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_532, float2(0.0), isnan(_532))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_532, float2(0.0), isnan(_532))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float2 _548 = float2(_123, _125);
    float4 _152 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_548, float2(0.0), isnan(_548))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_548, float2(0.0), isnan(_548))).xyzw;
    float _154 = _152.x;
    float _156 = _152.y;
    float _158 = _152.z;
    float _160 = _152.w;
    float2 _564 = float2(_127, _129);
    float4 _162 = dm_bs(spvDescriptorSet0.fp_t_tcb_34.sample(spvDescriptorSet0.fp_t_tcb_34Smplr, select(_564, float2(0.0), isnan(_564))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_34, spvDescriptorSet0.fp_t_tcb_34Smplr_w, select(_564, float2(0.0), isnan(_564))).xyzw;
    float _164 = _162.x;
    float _166 = _162.y;
    float _168 = _162.z;
    float _170 = _162.w;
    float _172 = in.m_45.w;
    float _174 = gl_FragCoord.w;
    float _176 = _172 * _174;
    float _178 = in.m_47.w;
    float _180 = gl_FragCoord.w;
    float _182 = _178 * _180;
    float _184 = in.m_49.x;
    float _186 = gl_FragCoord.w;
    float _188 = _184 * _186;
    float _190 = _113 * _176;
    float _192 = _113 * _182;
    float _194 = in.m_47.z;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = _113 * _198;
    float _202 = _140 + _150;
    float _204 = _202 * _160;
    float _206 = -_190;
    float _208 = fma(_204, _170, _206);
    float _210 = _113 * _188;
    float _212 = _192 * _208;
    float _214 = 0.0 + _212;
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = _216 * _210;
    bool _222 = _218 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _224 = isnan(_218);
    bool _226 = _222 || _224;
    bool _228 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _230 = _226 || _228;
    float _232 = in.m_45.x;
    float _234 = gl_FragCoord.w;
    float _236 = _232 * _234;
    float _238 = in.m_47.x;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_45.y;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    float _250 = in.m_47.y;
    float _252 = gl_FragCoord.w;
    float _254 = _250 * _252;
    float _256 = in.m_45.z;
    float _258 = gl_FragCoord.w;
    float _260 = _256 * _258;
    if (!_230)
    {
        discard_fragment();
    }
    float _262 = _146 * _146;
    float _264 = _148 * _148;
    float _266 = _144 * _144;
    float _268 = _156 * _156;
    float _270 = fma(_136, _136, _262);
    float _272 = fma(_138, _138, _264);
    float _274 = _158 * _158;
    float _276 = fma(_134, _134, _266);
    float _278 = _154 * _154;
    float _280 = _270 * _268;
    float _282 = _272 * _274;
    float _284 = _276 * _278;
    float _286 = _280 * _166;
    float _288 = _282 * _168;
    float _290 = _113 * _236;
    float _292 = _284 * _164;
    float _294 = _113 * _242;
    float _296 = _113 * _248;
    float _298 = _113 * _254;
    float _300 = _113 * _260;
    float _302 = fma(_292, _290, _294);
    float _304 = fma(_286, _296, _298);
    float _306 = fma(_288, _300, _200);
    if (!_230)
    {
        out.m_52.x = _302;
        out.m_52.y = _304;
        out.m_52.z = _306;
        out.m_52.w = _212;
        return out;
    }
    float _308 = _304 * 0.715200006961822509765625;
    float _310 = in.m_54.w;
    float _312 = gl_FragCoord.w;
    float _314 = _310 * _312;
    float _316 = in.m_54.z;
    float _318 = gl_FragCoord.w;
    float _320 = _316 * _318;
    float _322 = in.m_54.x;
    float _324 = gl_FragCoord.w;
    float _326 = _322 * _324;
    float _328 = fma(_302, 0.2125999927520751953125, _308);
    float _330 = in.m_54.y;
    float _332 = gl_FragCoord.w;
    float _334 = _330 * _332;
    float _336 = fma(_306, 0.072200000286102294921875, _328);
    bool _338 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _340 = 1.0 / _336;
    float _342 = _340 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = fma(_344, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _348 = _113 * _314;
    float _350 = _113 * _320;
    float _352 = _346 * _348;
    float _354 = 0.0 + _218;
    float _356 = precise::clamp(_354, 0.0, 1.0);
    float _358 = _113 * _326;
    float _360 = _113 * _334;
    float _362 = fma(_306, _352, _350);
    float _364 = fma(_302, _352, _358);
    float _366 = fma(_304, _352, _360);
    float _368 = _350;
    if (!_338)
    {
        _368 = _356;
    }
    float _370 = _368;
    bool _372 = !_338;
    float _374 = _370;
    if (!_372)
    {
        float _376 = in.m_56.w;
        float _378 = gl_FragCoord.w;
        float _380 = _376 * _378;
        float _382 = in.m_56.z;
        float _384 = gl_FragCoord.w;
        float _386 = _382 * _384;
        float _388 = _113 * _380;
        float _390 = _113 * _386;
        float _392 = 1.0 / _388;
        float _394 = _390 * _392;
        float _396 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _398 = fma(_394, (*spvDescriptorSet0.fp_c8)._m0[30].w, _396);
        float _400 = 1.0 / _398;
        float _402 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _404 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _406 = fma(_400, _402, _404);
        float _408 = _406 * 8.0;
        float _410 = precise::clamp(_408, 0.0, 1.0);
        float _412 = _356 * _410;
        _374 = _412;
    }
    float _414 = _374;
    float _416 = 0.0 + _414;
    float _418 = precise::clamp(_416, 0.0, 1.0);
    out.m_52.x = _364;
    out.m_52.y = _366;
    out.m_52.z = _362;
    out.m_52.w = _418;
    return out;
}

