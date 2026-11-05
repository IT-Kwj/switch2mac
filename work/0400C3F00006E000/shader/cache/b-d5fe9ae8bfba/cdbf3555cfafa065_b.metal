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
    constant _16* fp_c10 [[id(2)]];
    constant _16* fp_c15 [[id(3)]];
    texture2d<float> fp_t_tcb_8 [[id(4)]];
    sampler fp_t_tcb_8Smplr [[id(5)]];
    texture2d<float> fp_t_tcb_A [[id(6)]];
    sampler fp_t_tcb_ASmplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    sampler fp_t_tcb_8Smplr_w [[id(10)]];
    sampler fp_t_tcb_ASmplr_w [[id(11)]];
    sampler fp_t_tcb_CSmplr_w [[id(12)]];
    constant dm_border_t* dm_border [[id(13)]];
};

struct main0_out
{
    float4 m_50 [[color(0)]];
};

struct main0_in
{
    float4 m_43 [[user(locn0)]];
    float4 m_41 [[user(locn1)]];
    float4 m_37 [[user(locn2), flat]];
    float4 m_54 [[user(locn3)]];
    float4 m_45 [[user(locn4)]];
    float4 m_47 [[user(locn6)]];
    float4 m_52 [[user(locn7)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = in.m_37.x;
    float _63 = gl_FragCoord.w;
    float _65 = in.m_37.y;
    float _67 = in.m_41.y;
    float _69 = gl_FragCoord.w;
    float _71 = _67 * _69;
    float _73 = in.m_41.x;
    float _75 = gl_FragCoord.w;
    float _77 = _73 * _75;
    float _79 = 1.0 / _61;
    float _81 = 1.0 / _63;
    float _83 = _65 * _79;
    float _85 = _81 * _71;
    float _87 = _85 * _83;
    float _89 = precise::max(0.0, _87);
    float _91 = _81 * _77;
    float _93 = precise::min(_89, 0.5);
    float2 _468;
    _468.x = spvDescriptorSet0.fp_t_tcb_8.calculate_clamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_91, _93));
    _468.y = spvDescriptorSet0.fp_t_tcb_8.calculate_unclamped_lod(spvDescriptorSet0.fp_t_tcb_8Smplr, float2(_91, _93));
    float _95 = _468.x;
    float _97 = _95 * 256.0;
    int _100 = int(_97);
    float _102 = in.m_41.z;
    float _104 = gl_FragCoord.w;
    float _106 = _102 * _104;
    float _108 = in.m_41.w;
    float _110 = gl_FragCoord.w;
    float _112 = _108 * _110;
    float _114 = _81 * _106;
    float _116 = _81 * _112;
    float2 _499 = float2(_114, _116);
    float _118 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_499, float2(0.0), isnan(_499))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_499, float2(0.0), isnan(_499))).w;
    float _120 = float(uint(_100));
    float _122 = _120 * 0.00390625;
    float _124 = precise::min(_122, 2.0);
    float2 _518 = float2(_91, _93);
    float _126 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_518, float2(0.0), isnan(_518)), level(_124)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_518, float2(0.0), isnan(_518)), level(_124)).w;
    float _128 = in.m_43.w;
    float _130 = gl_FragCoord.w;
    float _132 = _128 * _130;
    float _134 = in.m_45.x;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = abs(_118);
    float _142 = log2(_140);
    float _144 = _81 * _132;
    float _146 = _81 * _138;
    float _148 = _142 * (*spvDescriptorSet0.fp_c9)._m0[194].z;
    float _150 = exp2(_148);
    float _152 = in.m_47.y;
    float _154 = gl_FragCoord.w;
    float _156 = _152 * _154;
    float _158 = in.m_47.x;
    float _160 = gl_FragCoord.w;
    float _162 = _158 * _160;
    float _164 = _81 * _156;
    float _166 = _81 * _162;
    float _168 = _164 * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _170 = _164 * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _172 = _164 * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _174 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[0].x, _168);
    float _176 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[1].x, _170);
    float _178 = fma(_166, (*spvDescriptorSet0.fp_c8)._m0[2].x, _172);
    float _180 = in.m_47.z;
    float _182 = gl_FragCoord.w;
    float _184 = _180 * _182;
    float _186 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[1].y;
    float _188 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[1].x, _186);
    float _190 = _81 * _184;
    float _192 = fma(_190, (*spvDescriptorSet0.fp_c8)._m0[2].z, _178);
    float _194 = fma(_190, (*spvDescriptorSet0.fp_c8)._m0[0].z, _174);
    float _196 = fma(_190, (*spvDescriptorSet0.fp_c8)._m0[1].z, _176);
    float _198 = _192 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _200 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[0].y;
    float _202 = (*spvDescriptorSet0.fp_c10)._m0[9].w * (*spvDescriptorSet0.fp_c8)._m0[2].y;
    float _204 = 1.0 / _198;
    float _206 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[0].x, _200);
    float _208 = fma((*spvDescriptorSet0.fp_c10)._m0[8].w, (*spvDescriptorSet0.fp_c8)._m0[2].x, _202);
    float _210 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[2].z, _208);
    float _212 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[0].z, _206);
    float _214 = fma((*spvDescriptorSet0.fp_c10)._m0[10].w, (*spvDescriptorSet0.fp_c8)._m0[1].z, _188);
    float _216 = _210 + (*spvDescriptorSet0.fp_c8)._m0[2].w;
    float _218 = _212 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _220 = _214 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _222 = _194 + (*spvDescriptorSet0.fp_c8)._m0[0].w;
    float _224 = _216 * _204;
    float _226 = _196 + (*spvDescriptorSet0.fp_c8)._m0[1].w;
    float _228 = -_218;
    float _230 = fma(_222, _224, _228);
    float _232 = -_224;
    float _234 = fma(_226, _232, _220);
    float _236 = (*spvDescriptorSet0.fp_c10)._m0[5].x * (*spvDescriptorSet0.fp_c10)._m0[5].x;
    float _238 = _126 * _150;
    float _240 = _238 * _144;
    float _242 = precise::clamp(_240, 0.0, 1.0);
    float _244 = _242 * _146;
    bool _248 = _244 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _250 = isnan(_244);
    bool _252 = _248 || _250;
    bool _254 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _256 = _252 || _254;
    if (!_256)
    {
        discard_fragment();
    }
    float _258 = fma((*spvDescriptorSet0.fp_c10)._m0[4].x, (*spvDescriptorSet0.fp_c10)._m0[4].x, _236);
    float _260 = fma((*spvDescriptorSet0.fp_c10)._m0[6].x, (*spvDescriptorSet0.fp_c10)._m0[6].x, _258);
    float _262 = rsqrt(_260);
    float _264 = _234 * _262;
    float _266 = _230 * _262;
    float _268 = _264 * _264;
    float _270 = fma(_266, _266, _268);
    float _272 = sqrt(_270);
    float _274 = 0.0 + _272;
    float _276 = precise::clamp(_274, 0.0, 1.0);
    float _278 = -_276;
    float _280 = _278 + 1.0;
    float _282 = _280 * _280;
    float _284 = _282 * 0.5;
    float _286 = fma((*spvDescriptorSet0.fp_c10)._m0[2].x, 0.0166666693985462188720703125, _284);
    float2 _812 = float2(_282, _286);
    float3 _290 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_812, float2(0.0), isnan(_812))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_812, float2(0.0), isnan(_812))).xyz;
    float _292 = _290.x;
    float _294 = _290.y;
    float _296 = _290.z;
    float _298 = _292 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _300 = _294 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    float _302 = _296 * (*spvDescriptorSet0.fp_c9)._m0[106].x;
    if (!_256)
    {
        out.m_50.x = _298;
        out.m_50.y = _300;
        out.m_50.z = _302;
        out.m_50.w = _242;
        return out;
    }
    float _304 = _300 * 0.715200006961822509765625;
    float _306 = in.m_52.w;
    float _308 = gl_FragCoord.w;
    float _310 = _306 * _308;
    float _312 = in.m_52.z;
    float _314 = gl_FragCoord.w;
    float _316 = _312 * _314;
    float _318 = in.m_52.x;
    float _320 = gl_FragCoord.w;
    float _322 = _318 * _320;
    float _324 = fma(_298, 0.2125999927520751953125, _304);
    float _326 = in.m_52.y;
    float _328 = gl_FragCoord.w;
    float _330 = _326 * _328;
    float _332 = 0.0 + _244;
    float _334 = precise::clamp(_332, 0.0, 1.0);
    float _336 = fma(_302, 0.072200000286102294921875, _324);
    bool _338 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _340 = 1.0 / _336;
    float _342 = _340 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _344 = precise::clamp(_342, 0.0, 1.0);
    float _346 = fma(_344, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _348 = _81 * _310;
    float _350 = _81 * _316;
    float _352 = _346 * _348;
    float _354 = _81 * _322;
    float _356 = _81 * _330;
    float _358 = fma(_302, _352, _350);
    float _360 = fma(_298, _352, _354);
    float _362 = fma(_300, _352, _356);
    float _364 = _350;
    if (!_338)
    {
        _364 = _334;
    }
    float _366 = _364;
    bool _368 = !_338;
    float _370 = _366;
    if (!_368)
    {
        float _372 = in.m_54.w;
        float _374 = gl_FragCoord.w;
        float _376 = _372 * _374;
        float _378 = in.m_54.z;
        float _380 = gl_FragCoord.w;
        float _382 = _378 * _380;
        float _384 = _81 * _376;
        float _386 = _81 * _382;
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
        float _408 = _334 * _406;
        _370 = _408;
    }
    float _410 = _370;
    float _412 = 0.0 + _410;
    float _414 = precise::clamp(_412, 0.0, 1.0);
    out.m_50.x = _360;
    out.m_50.y = _362;
    out.m_50.z = _358;
    out.m_50.w = _414;
    return out;
}

