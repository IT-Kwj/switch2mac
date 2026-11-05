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
    constant _16* fp_c10 [[id(0)]];
    constant _16* fp_c8 [[id(1)]];
    constant _16* fp_c9 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    sampler fp_t_tcb_ASmplr_w [[id(9)]];
    constant dm_border_t* dm_border [[id(10)]];
};

struct main0_out
{
    float4 m_46 [[color(0)]];
};

struct main0_in
{
    float4 m_39 [[user(locn0)]];
    float4 m_43 [[user(locn1)]];
    float4 m_48 [[user(locn2)]];
    float4 m_41 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _55 = gl_FragCoord.w;
    float _57 = in.m_37.x;
    float _59 = gl_FragCoord.w;
    float _61 = _57 * _59;
    float _63 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _65 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _67 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _69 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[3].y;
    float _71 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _63);
    float _73 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _65);
    float _75 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _67);
    float _77 = in.m_37.y;
    float _79 = gl_FragCoord.w;
    float _81 = _77 * _79;
    float _83 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _71);
    float _85 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _73);
    float _87 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[3].x, _69);
    float _89 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _75);
    float _91 = _83 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _93 = _85 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _95 = in.m_37.z;
    float _97 = gl_FragCoord.w;
    float _99 = _95 * _97;
    float _101 = in.m_37.w;
    float _103 = gl_FragCoord.w;
    float _105 = _101 * _103;
    float _107 = _91 * (*spvDescriptorSet0.fp_c8)._m0[7].y;
    float _109 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[3].z, _87);
    float _111 = _89 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _113 = _91 * (*spvDescriptorSet0.fp_c8)._m0[4].y;
    float _115 = fma(_93, (*spvDescriptorSet0.fp_c8)._m0[7].x, _107);
    float _117 = _109 + (*spvDescriptorSet0.fp_c8)._m0[3].w;
    float _119 = fma(_93, (*spvDescriptorSet0.fp_c8)._m0[4].x, _113);
    float _121 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[7].z, _115);
    float _123 = fma(_111, (*spvDescriptorSet0.fp_c8)._m0[4].z, _119);
    float _125 = 1.0 / _55;
    float _127 = fma(_117, (*spvDescriptorSet0.fp_c8)._m0[7].w, _121);
    float _129 = fma(_117, (*spvDescriptorSet0.fp_c8)._m0[4].w, _123);
    float _131 = 1.0 / _127;
    float _133 = _125 * _61;
    float _135 = _125 * _81;
    float _137 = _125 * _99;
    float _139 = _125 * _105;
    float2 _566 = float2(_133, _135);
    float4 _142 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_566, float2(0.0), isnan(_566))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_566, float2(0.0), isnan(_566))).xyzw;
    float _144 = _142.x;
    float _146 = _142.y;
    float _148 = _142.z;
    float _150 = _142.w;
    float _152 = -_129;
    float _154 = fma(_152, _131, _133);
    float2 _591 = float2(_154, _135);
    float4 _156 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_591, float2(0.0), isnan(_591))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_591, float2(0.0), isnan(_591))).xyzw;
    float _158 = _156.x;
    float _160 = _156.y;
    float _162 = _156.z;
    float _164 = _156.w;
    float2 _607 = float2(_137, _139);
    float4 _166 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_607, float2(0.0), isnan(_607))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_607, float2(0.0), isnan(_607))).xyzw;
    float _168 = _166.x;
    float _170 = _166.y;
    float _172 = _166.z;
    float _174 = _166.w;
    float _176 = in.m_39.w;
    float _178 = gl_FragCoord.w;
    float _180 = _176 * _178;
    float _182 = in.m_41.x;
    float _184 = gl_FragCoord.w;
    float _186 = _182 * _184;
    float _188 = in.m_43.z;
    float _190 = gl_FragCoord.w;
    float _192 = _188 * _190;
    float _194 = _125 * _180;
    float _196 = in.m_43.x;
    float _198 = gl_FragCoord.w;
    float _200 = _196 * _198;
    float _202 = in.m_39.y;
    float _204 = gl_FragCoord.w;
    float _206 = _202 * _204;
    float _208 = in.m_39.z;
    float _210 = gl_FragCoord.w;
    float _212 = _208 * _210;
    float _214 = _164 + _150;
    float _216 = _214 * _174;
    float _218 = _125 * _186;
    float _220 = _216 * _194;
    float _222 = precise::clamp(_220, 0.0, 1.0);
    float _224 = _222 * _218;
    bool _228 = _224 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _230 = isnan(_224);
    bool _232 = _228 || _230;
    bool _234 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _236 = _232 || _234;
    float _238 = in.m_43.y;
    float _240 = gl_FragCoord.w;
    float _242 = _238 * _240;
    float _244 = in.m_39.x;
    float _246 = gl_FragCoord.w;
    float _248 = _244 * _246;
    if (!_236)
    {
        discard_fragment();
    }
    float _250 = _144 * _144;
    float _252 = _146 * _146;
    float _254 = _148 * _148;
    float _256 = fma(_158, _158, _250);
    float _258 = fma(_160, _160, _252);
    float _260 = fma(_162, _162, _254);
    float _262 = _256 * _168;
    float _264 = _258 * _170;
    float _266 = _260 * _172;
    float _268 = _125 * _200;
    float _270 = -_262;
    float _272 = _270 + 1.0;
    float _274 = _125 * _192;
    float _276 = -_264;
    float _278 = _276 + 1.0;
    float _280 = _125 * _242;
    float _282 = -_266;
    float _284 = _282 + 1.0;
    float _286 = _268 * _272;
    float _288 = _125 * _248;
    float _290 = _280 * _278;
    float _292 = _274 * _284;
    float _294 = _125 * _206;
    float _296 = _125 * _212;
    float _298 = fma(_262, _288, _286);
    float _300 = fma(_264, _294, _290);
    float _302 = fma(_266, _296, _292);
    if (!_236)
    {
        out.m_46.x = _298;
        out.m_46.y = _300;
        out.m_46.z = _302;
        out.m_46.w = _222;
        return out;
    }
    float _304 = _300 * 0.715200006961822509765625;
    float _306 = 0.0 + _224;
    float _308 = precise::clamp(_306, 0.0, 1.0);
    float _310 = fma(_298, 0.2125999927520751953125, _304);
    bool _312 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _314 = fma(_302, 0.072200000286102294921875, _310);
    float _316 = 1.0 / _314;
    float _318 = _316 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _320 = precise::clamp(_318, 0.0, 1.0);
    float _322 = fma(_320, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _324 = _298 * _322;
    float _326 = _300 * _322;
    float _328 = _302 * _322;
    float _330 = _322;
    if (!_312)
    {
        _330 = _308;
    }
    float _332 = _330;
    bool _334 = !_312;
    float _336 = _332;
    if (!_334)
    {
        float _338 = in.m_48.w;
        float _340 = gl_FragCoord.w;
        float _342 = _338 * _340;
        float _344 = in.m_48.z;
        float _346 = gl_FragCoord.w;
        float _348 = _344 * _346;
        float _350 = _125 * _342;
        float _352 = _125 * _348;
        float _354 = 1.0 / _350;
        float _356 = _352 * _354;
        float _358 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _360 = fma(_356, (*spvDescriptorSet0.fp_c8)._m0[30].w, _358);
        float _362 = 1.0 / _360;
        float _364 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _366 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _368 = fma(_362, _364, _366);
        float _370 = _368 * 8.0;
        float _372 = precise::clamp(_370, 0.0, 1.0);
        float _374 = _308 * _372;
        _336 = _374;
    }
    float _376 = _336;
    float _378 = 0.0 + _376;
    float _380 = precise::clamp(_378, 0.0, 1.0);
    out.m_46.x = _324;
    out.m_46.y = _326;
    out.m_46.z = _328;
    out.m_46.w = _380;
    return out;
}

