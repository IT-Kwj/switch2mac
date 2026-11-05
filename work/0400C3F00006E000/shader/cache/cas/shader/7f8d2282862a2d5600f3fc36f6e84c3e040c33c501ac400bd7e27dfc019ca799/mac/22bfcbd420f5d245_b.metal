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
    constant _16* fp_c9 [[id(1)]];
    constant _16* fp_c15 [[id(2)]];
    texture2d<float> fp_t_tcb_C [[id(3)]];
    sampler fp_t_tcb_CSmplr [[id(4)]];
    texture2d<float> fp_t_tcb_8 [[id(5)]];
    sampler fp_t_tcb_8Smplr [[id(6)]];
    sampler fp_t_tcb_CSmplr_w [[id(7)]];
    sampler fp_t_tcb_8Smplr_w [[id(8)]];
    constant dm_border_t* dm_border [[id(9)]];
};

struct main0_out
{
    float4 m_52 [[color(0)]];
};

struct main0_in
{
    float4 m_45 [[user(locn0)]];
    float4 m_49 [[user(locn1)]];
    float4 m_39 [[user(locn2)]];
    float4 m_54 [[user(locn3)]];
    float4 m_37 [[user(locn4)]];
    float4 m_47 [[user(locn5)]];
    float4 m_41 [[user(locn6), flat]];
    float4 m_35 [[user(locn7)]];
    float4 m_43 [[user(locn8)]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], float4 gl_FragCoord [[position]])
{
    main0_out out = {};
    float _61 = gl_FragCoord.w;
    float _63 = in.m_35.x;
    float _65 = gl_FragCoord.w;
    float _67 = _63 * _65;
    float _69 = in.m_37.x;
    float _71 = gl_FragCoord.w;
    float _73 = _69 * _71;
    float _75 = in.m_37.y;
    float _77 = gl_FragCoord.w;
    float _79 = _75 * _77;
    float _81 = in.m_35.y;
    float _83 = gl_FragCoord.w;
    float _85 = _81 * _83;
    float _87 = 1.0 / _61;
    float _89 = _87 * _67;
    float _91 = _87 * _73;
    float _93 = _87 * _79;
    float _95 = _87 * _85;
    float2 _492 = float2(_89, _95);
    float _97 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_492, float2(0.0), isnan(_492))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_492, float2(0.0), isnan(_492))).w;
    float2 _503 = float2(_91, _93);
    float4 _100 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_503, float2(0.0), isnan(_503))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_503, float2(0.0), isnan(_503))).xyzw;
    float _102 = _100.x;
    float _104 = _100.y;
    float _106 = _100.z;
    float _108 = _100.w;
    float _110 = in.m_39.y;
    float _112 = gl_FragCoord.w;
    float _114 = _110 * _112;
    float _116 = in.m_39.x;
    float _118 = gl_FragCoord.w;
    float _120 = _116 * _118;
    float _122 = in.m_39.z;
    float _124 = gl_FragCoord.w;
    float _126 = _122 * _124;
    float _128 = in.m_41.y;
    float _130 = in.m_41.x;
    float _132 = in.m_41.z;
    float _134 = in.m_43.y;
    float _136 = gl_FragCoord.w;
    float _138 = _134 * _136;
    float _140 = in.m_43.x;
    float _142 = gl_FragCoord.w;
    float _144 = _140 * _142;
    float _146 = in.m_43.z;
    float _148 = gl_FragCoord.w;
    float _150 = _146 * _148;
    float _152 = _87 * _114;
    float _154 = _87 * _120;
    float _156 = _87 * _126;
    float _158 = -_128;
    float _160 = _158 + (*spvDescriptorSet0.fp_c8)._m0[29].y;
    float _162 = _152 * _152;
    float _164 = -_130;
    float _166 = _164 + (*spvDescriptorSet0.fp_c8)._m0[29].x;
    float _168 = -_132;
    float _170 = _168 + (*spvDescriptorSet0.fp_c8)._m0[29].z;
    float _172 = _160 * _160;
    float _174 = fma(_154, _154, _162);
    float _176 = fma(_166, _166, _172);
    float _178 = fma(_156, _156, _174);
    float _180 = _87 * _138;
    float _182 = _87 * _144;
    float _184 = fma(_170, _170, _176);
    float _186 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _188 = _186 + (*spvDescriptorSet0.fp_c9)._m0[139].w;
    float _190 = rsqrt(_178);
    float _192 = sqrt(_184);
    float _194 = _152 * _190;
    float _196 = _154 * _190;
    float _198 = _156 * _190;
    float _200 = 1.0 / _188;
    float _202 = _180 * _194;
    float _204 = in.m_45.w;
    float _206 = gl_FragCoord.w;
    float _208 = _204 * _206;
    float _210 = fma(_182, _196, _202);
    float _212 = _87 * _150;
    float _214 = fma(_192, 0.00999999977648258209228515625, -3.0);
    float _216 = precise::clamp(_214, 0.0, 1.0);
    float _218 = fma(_192, -0.0199999995529651641845703125, 12.0);
    float _220 = precise::clamp(_218, 0.0, 1.0);
    float _222 = fma(_212, _198, _210);
    float _224 = in.m_47.x;
    float _226 = gl_FragCoord.w;
    float _228 = _224 * _226;
    float _230 = abs(_222);
    float _232 = -(*spvDescriptorSet0.fp_c9)._m0[139].z;
    float _234 = _230 + _232;
    float _236 = fma(_216, -2.0, 3.0);
    float _238 = fma(_220, -2.0, 3.0);
    float _240 = _216 * _216;
    float _242 = _220 * _220;
    float _244 = _234 * _200;
    float _246 = precise::clamp(_244, 0.0, 1.0);
    float _248 = _236 * _240;
    float _250 = _238 * _242;
    float _252 = fma(_246, -2.0, 3.0);
    float _254 = _246 * _246;
    float _256 = _248 * _250;
    float _258 = _252 * _254;
    float _260 = _87 * _208;
    float _262 = in.m_49.z;
    float _264 = gl_FragCoord.w;
    float _266 = _262 * _264;
    float _268 = in.m_45.x;
    float _270 = gl_FragCoord.w;
    float _272 = _268 * _270;
    float _274 = in.m_45.y;
    float _276 = gl_FragCoord.w;
    float _278 = _274 * _276;
    float _280 = in.m_45.z;
    float _282 = gl_FragCoord.w;
    float _284 = _280 * _282;
    float _286 = _108 * _97;
    float _288 = _260 * _286;
    float _290 = _87 * _228;
    float _292 = _288 * _256;
    float _294 = 0.0 + _292;
    float _296 = precise::clamp(_294, 0.0, 1.0);
    float _298 = _296 * _258;
    float _300 = _298 * _290;
    bool _304 = _300 > (*spvDescriptorSet0.fp_c9)._m0[141].z;
    bool _306 = isnan(_300);
    bool _308 = _304 || _306;
    bool _310 = isnan((*spvDescriptorSet0.fp_c9)._m0[141].z);
    bool _312 = _308 || _310;
    float _314 = in.m_49.x;
    float _316 = gl_FragCoord.w;
    float _318 = _314 * _316;
    float _320 = in.m_49.y;
    float _322 = gl_FragCoord.w;
    float _324 = _320 * _322;
    if (!_312)
    {
        discard_fragment();
    }
    float _326 = -_104;
    float _328 = _326 + 1.0;
    float _330 = -_106;
    float _332 = _330 + 1.0;
    float _334 = _87 * _318;
    float _336 = _87 * _324;
    float _338 = _87 * _266;
    float _340 = -_102;
    float _342 = _340 + 1.0;
    float _344 = _336 * _328;
    float _346 = _338 * _332;
    float _348 = _334 * _342;
    float _350 = _87 * _272;
    float _352 = _87 * _278;
    float _354 = _87 * _284;
    float _356 = fma(_102, _350, _348);
    float _358 = fma(_104, _352, _344);
    float _360 = fma(_106, _354, _346);
    if (!_312)
    {
        out.m_52.x = _356;
        out.m_52.y = _358;
        out.m_52.z = _360;
        out.m_52.w = _292;
        return out;
    }
    float _362 = _358 * 0.715200006961822509765625;
    float _364 = 0.0 + _300;
    float _366 = precise::clamp(_364, 0.0, 1.0);
    float _368 = fma(_356, 0.2125999927520751953125, _362);
    bool _370 = (*spvDescriptorSet0.fp_c15)._m0[653].w >= 0.5;
    float _372 = fma(_360, 0.072200000286102294921875, _368);
    float _374 = 1.0 / _372;
    float _376 = _374 * (*spvDescriptorSet0.fp_c15)._m0[2].z;
    float _378 = precise::clamp(_376, 0.0, 1.0);
    float _380 = fma(_378, (*spvDescriptorSet0.fp_c15)._m0[2].y, (*spvDescriptorSet0.fp_c15)._m0[2].x);
    float _382 = _356 * _380;
    float _384 = _358 * _380;
    float _386 = _360 * _380;
    float _388 = _380;
    if (!_370)
    {
        _388 = _366;
    }
    float _390 = _388;
    bool _392 = !_370;
    float _394 = _390;
    if (!_392)
    {
        float _396 = in.m_54.w;
        float _398 = gl_FragCoord.w;
        float _400 = _396 * _398;
        float _402 = in.m_54.z;
        float _404 = gl_FragCoord.w;
        float _406 = _402 * _404;
        float _408 = _87 * _400;
        float _410 = _87 * _406;
        float _412 = 1.0 / _408;
        float _414 = _410 * _412;
        float _416 = -(*spvDescriptorSet0.fp_c8)._m0[30].y;
        float _418 = fma(_414, (*spvDescriptorSet0.fp_c8)._m0[30].w, _416);
        float _420 = 1.0 / _418;
        float _422 = -(*spvDescriptorSet0.fp_c8)._m0[30].z;
        float _424 = -(*spvDescriptorSet0.fp_c8)._m0[30].x;
        float _426 = fma(_420, _422, _424);
        float _428 = _426 * 8.0;
        float _430 = precise::clamp(_428, 0.0, 1.0);
        float _432 = _366 * _430;
        _394 = _432;
    }
    float _434 = _394;
    float _436 = 0.0 + _434;
    float _438 = precise::clamp(_436, 0.0, 1.0);
    out.m_52.x = _382;
    out.m_52.y = _384;
    out.m_52.z = _386;
    out.m_52.w = _438;
    return out;
}

