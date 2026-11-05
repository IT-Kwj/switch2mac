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
    texture2d<float> fp_t_tcb_C [[id(5)]];
    sampler fp_t_tcb_CSmplr [[id(6)]];
    texture2d<float> fp_t_tcb_A [[id(7)]];
    sampler fp_t_tcb_ASmplr [[id(8)]];
    sampler fp_t_tcb_8Smplr_w [[id(9)]];
    sampler fp_t_tcb_CSmplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    constant dm_border_t* dm_border [[id(12)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_47 [[user(locn1)]];
    float4 m_49 [[user(locn2)]];
    float4 m_45 [[user(locn3)]];
    float4 m_39 [[user(locn4), flat]];
    float4 m_37 [[user(locn5)]];
    float4 m_56 [[user(locn6)]];
    float4 m_41 [[user(locn7)]];
    float4 m_54 [[user(locn9)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.x;
    float _67 = gl_FragCoord.w;
    float _69 = _65 * _67;
    float _71 = in.m_37.y;
    float _73 = gl_FragCoord.w;
    float _75 = _71 * _73;
    float _77 = 1.0 / _63;
    float _79 = _77 * _69;
    float _81 = _77 * _75;
    float2 _447 = float2(_79, _81);
    float2 _85 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_447, float2(0.0), isnan(_447))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_447, float2(0.0), isnan(_447))).xy;
    float _87 = _85.x;
    float _89 = _85.y;
    float _91 = in.m_37.z;
    float _93 = gl_FragCoord.w;
    float _95 = _91 * _93;
    float _97 = in.m_39.x;
    float _99 = in.m_37.w;
    float _101 = gl_FragCoord.w;
    float _103 = _99 * _101;
    float _105 = in.m_41.y;
    float _107 = gl_FragCoord.w;
    float _109 = _105 * _107;
    float _111 = in.m_41.x;
    float _113 = gl_FragCoord.w;
    float _115 = _111 * _113;
    float _117 = _77 * _95;
    float _119 = _97 * (*spvDescriptorSet0.fp_c9)._m0[21].x;
    float _121 = _77 * _109;
    float _123 = fma(_87, 2.0, -1.0);
    float _125 = fma(_89, 2.0, -1.0);
    float _127 = _97 * (*spvDescriptorSet0.fp_c9)._m0[21].y;
    float _129 = _77 * _103;
    float _131 = fma(_119, _123, _117);
    float _133 = _77 * _115;
    float _135 = fma(_127, _125, _129);
    float2 _530 = float2(_133, _121);
    float _137 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_530, float2(0.0), isnan(_530))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_530, float2(0.0), isnan(_530))).w;
    float2 _538 = float2(_131, _135);
    float4 _140 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_538, float2(0.0), isnan(_538))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_538, float2(0.0), isnan(_538))).xyzw;
    float _142 = _140.x;
    float _144 = _140.y;
    float _146 = _140.z;
    float _148 = _140.w;
    float _150 = in.m_43.w;
    float _152 = gl_FragCoord.w;
    float _154 = _150 * _152;
    float _156 = in.m_45.w;
    float _158 = gl_FragCoord.w;
    float _160 = _156 * _158;
    float _162 = in.m_47.w;
    float _164 = gl_FragCoord.w;
    float _166 = _162 * _164;
    float _168 = in.m_49.x;
    float _170 = gl_FragCoord.w;
    float _172 = _168 * _170;
    float _174 = _77 * _160;
    float _176 = in.m_47.y;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_47.z;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_45.x;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = in.m_45.y;
    float _196 = gl_FragCoord.w;
    float _198 = _194 * _196;
    float _200 = in.m_45.z;
    float _202 = gl_FragCoord.w;
    float _204 = _200 * _202;
    float _206 = _77 * _180;
    float _208 = _148 * _137;
    float _210 = _77 * _154;
    float _212 = _77 * _166;
    float _214 = -_210;
    float _216 = fma(_208, _174, _214);
    float _218 = _212 * _216;
    float _220 = _77 * _172;
    float _222 = 0.0 + _218;
    float _224 = precise::clamp(_222, 0.0, 1.0);
    float _226 = _224 * _220;
    bool _230 = _226 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _232 = isnan(_226);
    bool _234 = _230 || _232;
    bool _236 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _238 = _234 || _236;
    float _240 = in.m_43.x;
    float _242 = gl_FragCoord.w;
    float _244 = _240 * _242;
    float _246 = in.m_47.x;
    float _248 = gl_FragCoord.w;
    float _250 = _246 * _248;
    float _252 = in.m_43.y;
    float _254 = gl_FragCoord.w;
    float _256 = _252 * _254;
    float _258 = in.m_43.z;
    float _260 = gl_FragCoord.w;
    float _262 = _258 * _260;
    if (!_238)
    {
        discard_fragment();
    }
    float _264 = _77 * _244;
    float _266 = _77 * _250;
    float _268 = _77 * _256;
    float _270 = _77 * _262;
    float _272 = _77 * _186;
    float _274 = -_266;
    float _276 = _264 + _274;
    float _278 = -_206;
    float _280 = _268 + _278;
    float _282 = -_272;
    float _284 = _270 + _282;
    float _286 = fma(_142, _276, _266);
    float _288 = fma(_144, _280, _206);
    float _290 = _77 * _192;
    float _292 = fma(_146, _284, _272);
    float _294 = _77 * _198;
    float _296 = _77 * _204;
    float _298 = _286 * _290;
    float _300 = _288 * _294;
    float _302 = _292 * _296;
    if (!_238)
    {
        out.m_52.x = _298;
        out.m_52.y = _300;
        out.m_52.z = _302;
        out.m_52.w = _218;
        return out;
    }
    float _304 = _300 * 0.715200006961822509765625;
    float _306 = in.m_54.w;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_54.z;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_54.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = fma(_298, 0.2125999927520751953125, _304);
    float _326 = in.m_54.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = fma(_302, 0.072200000286102294921875, _324);
    bool _334 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _336 = 1.0 / _332;
    float _338 = _336 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _340 = precise::clamp(_338, 0.0, 1.0);
    float _342 = _77 * _310;
    float _344 = fma(_340, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _346 = _77 * _316;
    float _348 = _344 * _342;
    float _350 = 0.0 + _226;
    float _352 = precise::clamp(_350, 0.0, 1.0);
    float _354 = _77 * _322;
    float _356 = _77 * _330;
    float _358 = fma(_302, _348, _346);
    float _360 = fma(_298, _348, _354);
    float _362 = fma(_300, _348, _356);
    float _364 = _346;
    if (!_334)
    {
        _364 = _352;
    }
    float _366 = _364;
    bool _368 = !_334;
    float _370 = _366;
    if (!_368)
    {
        float _372 = in.m_56.w;
        float _374 = gl_FragCoord.w;
        float _376 = _372 * _374;
        float _378 = in.m_56.z;
        float _380 = gl_FragCoord.w;
        float _382 = _378 * _380;
        float _384 = _77 * _376;
        float _386 = _77 * _382;
        float _388 = 1.0 / _384;
        float _390 = _386 * _388;
        float _392 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _394 = fma(_390, (*spvDescriptorSet0.fp_c8)._m0[30].w, _392);
        float _396 = 1.0 / _394;
        float _398 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _400 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _402 = fma(_396, _398, _400);
        float _404 = _402 * 8.0;
        float _406 = precise::clamp(_404, 0.0, 1.0);
        float _408 = _352 * _406;
        _370 = _408;
    }
    float _410 = _370;
    float _412 = 0.0 + _410;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    out.m_52.x = _360;
    out.m_52.y = _362;
    out.m_52.z = _358;
    out.m_52.w = _414;
    return out;
}

