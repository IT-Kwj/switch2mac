#pragma clang diagnostic ignored "-Wmissing-prototypes"

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

template <typename T>
static inline depth2d<T> spvDepthCast(texture2d<T> t)
{
    return reinterpret_cast<thread const depth2d<T> &>(t);
}

template <typename T>
static inline depth2d_array<T> spvDepthCast(texture2d_array<T> t)
{
    return reinterpret_cast<thread const depth2d_array<T> &>(t);
}

template <typename T>
static inline depthcube<T> spvDepthCast(texturecube<T> t)
{
    return reinterpret_cast<thread const depthcube<T> &>(t);
}

template <typename T>
static inline depthcube_array<T> spvDepthCast(texturecube_array<T> t)
{
    return reinterpret_cast<thread const depthcube_array<T> &>(t);
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
    constant _16* fp_c1 [[id(0)]];
    constant _16* fp_c3 [[id(1)]];
    texture2d<float> fp_t_tcb_8 [[id(2)]];
    sampler fp_t_tcb_8Smplr [[id(3)]];
    texture2d<float> fp_t_tcb_C [[id(4)]];
    sampler fp_t_tcb_CSmplr [[id(5)]];
    texture2d<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d_array<float> fp_t_tcb_E [[id(8)]];
    sampler fp_t_tcb_ESmplr [[id(9)]];
    texture2d<float> fp_t_tcb_A [[id(10)]];
    sampler fp_t_tcb_ASmplr [[id(11)]];
    sampler fp_t_tcb_8Smplr_w [[id(12)]];
    sampler fp_t_tcb_CSmplr_w [[id(13)]];
    sampler fp_t_tcb_10Smplr_w [[id(14)]];
    sampler fp_t_tcb_ASmplr_w [[id(15)]];
    constant dm_border_t* dm_border [[id(16)]];
};

struct main0_out
{
    float4 m_49 [[color(0)]];
};

struct main0_in
{
    float4 m_42 [[user(locn0), center_no_perspective]];
    float4 m_46 [[user(locn1), center_no_perspective]];
    float4 m_44 [[user(locn2), center_no_perspective]];
    float4 m_40 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _282 = false;
    bool _280 = false;
    float _56 = in.m_40.x;
    float _58 = in.m_40.y;
    float2 _568 = float2(_56, _58);
    float3 _62 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_568, float2(0.0), isnan(_568)), int2(0), component::x).xyw;
    float _64 = _62.x;
    float _66 = _62.y;
    float _68 = _62.z;
    float2 _585 = float2(_56, _58);
    float _70 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_585, float2(0.0), isnan(_585))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_585, float2(0.0), isnan(_585))).x;
    float _72 = in.m_42.y;
    float _74 = in.m_42.x;
    float _76 = in.m_44.y;
    float _78 = in.m_46.y;
    float _80 = in.m_44.x;
    float _82 = in.m_46.x;
    float _84 = -_64;
    float _86 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _88 = fma(_84, (*spvDescriptorSet0.fp_c3)._m0[46].z, _86);
    float _90 = -_66;
    float _92 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _94 = fma(_90, (*spvDescriptorSet0.fp_c3)._m0[46].z, _92);
    float _96 = -_68;
    float _98 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _100 = fma(_96, (*spvDescriptorSet0.fp_c3)._m0[46].z, _98);
    float _102 = _72 * _88;
    float _104 = _74 * _88;
    float _106 = -_102;
    float _108 = fma(_94, _76, _106);
    float _110 = -_102;
    float _112 = fma(_100, _78, _110);
    float _114 = -_104;
    float _116 = fma(_94, _80, _114);
    float _118 = -_104;
    float _120 = fma(_100, _82, _118);
    float _122 = _108 * _108;
    float _124 = _112 * _112;
    float _126 = -_88;
    float _128 = _126 + _94;
    float _130 = -_88;
    float _132 = _130 + _100;
    float _134 = fma(_116, _116, _122);
    float _136 = fma(_120, _120, _124);
    float _138 = fma(_128, _128, _134);
    float _140 = fma(_132, _132, _136);
    float _142 = rsqrt(_138);
    float _144 = rsqrt(_140);
    float _146 = -_70;
    float _148 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _150 = fma(_146, (*spvDescriptorSet0.fp_c3)._m0[46].z, _148);
    float _152 = _150 * _72;
    float _154 = -_150;
    bool _158 = _154 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _160 = _150 * _74;
    float _162 = _116 * _142;
    float _164 = _128 * _142;
    float _166 = _108 * _142;
    float _168 = -_150;
    bool _170 = _168 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _172 = -_150;
    bool _174 = _172 > (*spvDescriptorSet0.fp_c3)._m0[41].x;
    float _176 = _132 * _144;
    float _178 = _112 * _144;
    float _180 = _120 * _144;
    float _182 = _162 * _176;
    float _184 = _164 * _178;
    float _186 = _166 * _180;
    float _188 = -_182;
    float _190 = fma(_164, _180, _188);
    float _192 = -_184;
    float _194 = fma(_166, _176, _192);
    float _196 = -_186;
    float _198 = fma(_162, _178, _196);
    float _200 = _190 * _190;
    int _203 = 2;
    if (!_158)
    {
        _203 = 1;
    }
    int _205 = _203;
    float _207 = fma(_194, _194, _200);
    bool _209 = !_158;
    int _211 = _209 ? 0 : 1;
    float _213 = fma(_198, _198, _207);
    int _215 = _205;
    if (!_170)
    {
        _215 = _211;
    }
    int _217 = _215;
    float _219 = rsqrt(_213);
    int _221 = _217 + 1;
    uint _224 = uint(_221);
    if (!_174)
    {
        _224 = uint(_217);
    }
    uint _226 = _224;
    uint _228 = min(_226, 2u);
    int _230 = int(_228) << 2;
    float _232 = _190 * _219;
    float _234 = _194 * _219;
    float _236 = _198 * _219;
    float _238 = _232 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _240 = uint(int(uint(_230) >> uint(2)));
    uint _242 = uint(int(uint(int(_240)) >> uint(2)));
    int _244 = int(_240) & 3;
    float _246 = (*spvDescriptorSet0.fp_c1)._m0[int(_242)][_244];
    float _248 = fma(_234, (*spvDescriptorSet0.fp_c3)._m0[35].x, _238);
    float _250 = fma(_236, (*spvDescriptorSet0.fp_c3)._m0[35].z, _248);
    float _252 = abs(_250);
    float _254 = -_252;
    float _256 = _254 + 1.0;
    float _258 = precise::clamp(_256, 0.0, 1.0);
    float _260 = abs(_258);
    float _262 = log2(_260);
    float _264 = _262 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _266 = exp2(_264);
    float _268 = _266 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _270 = fma(_234, _268, _160);
    float _272 = fma(_232, _268, _152);
    float _274 = fma(_236, _268, _150);
    bool _276 = as_type<int>(_246) == 1264;
    if (!_276)
    {
        bool _278 = as_type<int>(_246) == 1536;
        _280 = _278;
        if (!_280)
        {
            _282 = true;
        }
    }
    float _316;
    float _318;
    float _320;
    float _322;
    if (!_280)
    {
        if (!_282)
        {
            float _284 = _272 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _286 = _272 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _288 = _272 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _290 = _272 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _292 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[0].x, _284);
            float _294 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[1].x, _286);
            float _296 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[2].x, _288);
            float _298 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[3].x, _290);
            float _300 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[0].z, _292);
            float _302 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[1].z, _294);
            float _304 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[2].z, _296);
            float _306 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[3].z, _298);
            float _308 = _300 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _310 = _302 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _312 = _304 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _314 = _306 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _316 = _314;
            _318 = _312;
            _320 = _308;
            _322 = _310;
        }
    }
    if ((false || _282) || _280)
    {
        if ((!_282) || _280)
        {
            _280 = false;
            float _324 = _272 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _326 = _272 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _328 = _272 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _330 = _272 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _332 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[4].x, _324);
            float _334 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[5].x, _326);
            float _336 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[6].x, _328);
            float _338 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[7].x, _330);
            float _340 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[4].z, _332);
            float _342 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[5].z, _334);
            float _344 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[6].z, _336);
            float _346 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[7].z, _338);
            float _348 = _340 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _350 = _342 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _352 = _344 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _354 = _346 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _316 = _354;
            _318 = _352;
            _320 = _348;
            _322 = _350;
        }
        if (false || _282)
        {
            _282 = false;
            float _356 = _272 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _358 = _272 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _360 = _272 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _362 = _272 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _364 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[8].x, _356);
            float _366 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[9].x, _358);
            float _368 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[10].x, _360);
            float _370 = fma(_270, (*spvDescriptorSet0.fp_c3)._m0[11].x, _362);
            float _372 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[8].z, _364);
            float _374 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[9].z, _366);
            float _376 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[10].z, _368);
            float _378 = fma(_274, (*spvDescriptorSet0.fp_c3)._m0[11].z, _370);
            float _380 = _372 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _382 = _374 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _384 = _376 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _386 = _378 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _316 = _386;
            _318 = _384;
            _320 = _380;
            _322 = _382;
        }
    }
    float _388 = _316;
    float _390 = _318;
    float _392 = _320;
    float _394 = _322;
    float2 _1191 = float2(_56, _58);
    float2 _398 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_1191, float2(0.0), isnan(_1191))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_1191, float2(0.0), isnan(_1191))).xy;
    float _400 = _398.x;
    float _402 = _398.y;
    float _404 = _152 * (*spvDescriptorSet0.fp_c3)._m0[15].y;
    float _406 = _152 * (*spvDescriptorSet0.fp_c3)._m0[13].y;
    float _408 = 1.0 / _388;
    float _410 = float(int(_226));
    float _412 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[15].x, _404);
    float _414 = _152 * (*spvDescriptorSet0.fp_c3)._m0[12].y;
    float _416 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[13].x, _406);
    float _418 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[15].z, _412);
    float _420 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[13].z, _416);
    float _422 = rint(_410);
    float _424 = precise::max(_422, 0.0);
    uint _426 = uint(_424);
    uint _428 = clamp(_426, 0u, 65535u);
    float _430 = _418 + (*spvDescriptorSet0.fp_c3)._m0[15].w;
    float _432 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[12].x, _414);
    float _434 = _420 + (*spvDescriptorSet0.fp_c3)._m0[13].w;
    float _436 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[12].z, _432);
    float _438 = _408 * _390;
    float _440 = precise::clamp(_438, 0.0, 1.0);
    float _442 = 1.0 / _430;
    float _444 = _408 * _392;
    float _446 = _436 + (*spvDescriptorSet0.fp_c3)._m0[12].w;
    float _448 = _408 * _394;
    float _450 = _440 * (*spvDescriptorSet0.fp_c3)._m0[47].x;
    float _452 = _446 * _442;
    float _454 = _434 * _442;
    float _456 = _450 * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _458 = _450 * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float2 _1308 = float2(_452, _454);
    float2 _460 = dm_bs(spvDescriptorSet0.fp_t_tcb_10.sample(spvDescriptorSet0.fp_t_tcb_10Smplr, select(_1308, float2(0.0), isnan(_1308))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_10, spvDescriptorSet0.fp_t_tcb_10Smplr_w, select(_1308, float2(0.0), isnan(_1308))).xy;
    float _462 = _460.x;
    float _464 = _460.y;
    float _466 = fma(_456, 0.5, _444);
    float _468 = fma(_456, -0.5, _444);
    float _470 = fma(_458, 0.5, _448);
    float _472 = fma(_458, -0.5, _448);
    float _474 = fma(_402, 2.0, -1.0);
    float _476 = fma(_400, 2.0, -1.0);
    float _478 = _474 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _480 = _476 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float _482 = fma(_478, 2.0, _58);
    float _484 = fma(_480, 2.0, _56);
    float3 _1358 = float3(_468, _470, float(int(_428)));
    float3 _1362 = select(_1358, float3(0.0), isnan(_1358));
    float _486 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1362.xy, uint(rint(_1362.z)), _440);
    float3 _1371 = float3(_466, _470, float(int(_428)));
    float3 _1373 = select(_1371, float3(0.0), isnan(_1371));
    float _488 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1373.xy, uint(rint(_1373.z)), _440);
    float3 _1382 = float3(_466, _472, float(int(_428)));
    float3 _1384 = select(_1382, float3(0.0), isnan(_1382));
    float _490 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1384.xy, uint(rint(_1384.z)), _440);
    float3 _1393 = float3(_468, _472, float(int(_428)));
    float3 _1395 = select(_1393, float3(0.0), isnan(_1393));
    float _492 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1395.xy, uint(rint(_1395.z)), _440);
    float2 _1401 = float2(_484, _482);
    float _494 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_1401, float2(0.0), isnan(_1401))), spvDescriptorSet0.dm_border, 3u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_1401, float2(0.0), isnan(_1401))).x;
    float _496 = _152 * (*spvDescriptorSet0.fp_c3)._m0[14].y;
    float _498 = fma(_160, (*spvDescriptorSet0.fp_c3)._m0[14].x, _496);
    float _500 = fma(_150, (*spvDescriptorSet0.fp_c3)._m0[14].z, _498);
    float _502 = _500 + (*spvDescriptorSet0.fp_c3)._m0[14].w;
    float _504 = precise::min(_502, 1.0);
    float _506 = -_462;
    float _508 = fma(_506, _462, _464);
    float _510 = -_462;
    float _512 = _504 + _510;
    float _514 = fma(_512, _512, _508);
    bool _516 = _512 <= 0.001000000047497451305389404296875;
    float _518 = float(_516);
    float _520 = 1.0 / _514;
    float _522 = -_150;
    float _524 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _526 = _522 + _524;
    float _528 = _526 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _530 = precise::clamp(_528, 0.0, 1.0);
    float _532 = _508 * _520;
    float _534 = -_150;
    float _536 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _538 = _534 + _536;
    float _540 = precise::max(_532, _518);
    float _542 = _538 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _544 = precise::clamp(_542, 0.0, 1.0);
    float _546 = precise::min(_540, 1.0);
    float _548 = _546 + _530;
    float _550 = _488 + _486;
    float _552 = _550 + _490;
    float _554 = _552 + _492;
    float _556 = fma(_554, 0.25, _544);
    out.m_49.x = _494;
    out.m_49.y = _556;
    out.m_49.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_49.w = _548;
    return out;
}

