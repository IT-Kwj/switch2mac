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
    texture2d_array<float> fp_t_tcb_E [[id(4)]];
    sampler fp_t_tcb_ESmplr [[id(5)]];
    texture2d_array<float> fp_t_tcb_10 [[id(6)]];
    sampler fp_t_tcb_10Smplr [[id(7)]];
    texture2d<float> fp_t_tcb_C [[id(8)]];
    sampler fp_t_tcb_CSmplr [[id(9)]];
    texture2d_array<float> fp_t_tcb_12 [[id(10)]];
    sampler fp_t_tcb_12Smplr [[id(11)]];
    texture2d<float> fp_t_tcb_A [[id(12)]];
    sampler fp_t_tcb_ASmplr [[id(13)]];
    sampler fp_t_tcb_8Smplr_w [[id(14)]];
    sampler fp_t_tcb_CSmplr_w [[id(15)]];
    sampler fp_t_tcb_ASmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_51 [[color(0)]];
};

struct main0_in
{
    float4 m_44 [[user(locn0), center_no_perspective]];
    float4 m_48 [[user(locn1), center_no_perspective]];
    float4 m_46 [[user(locn2), center_no_perspective]];
    float4 m_42 [[user(locn3), center_no_perspective]];
};

fragment main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    bool _274 = false;
    bool _272 = false;
    float _58 = in.m_42.x;
    float _60 = in.m_42.y;
    float2 _954 = float2(_58, _60);
    float3 _64 = spvDescriptorSet0.fp_t_tcb_8.gather(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_954, float2(0.0), isnan(_954)), int2(0), component::x).xyw;
    float _66 = _64.x;
    float _68 = _64.y;
    float _70 = _64.z;
    float2 _971 = float2(_58, _60);
    float _72 = dm_bs(spvDescriptorSet0.fp_t_tcb_8.sample(spvDescriptorSet0.fp_t_tcb_8Smplr, select(_971, float2(0.0), isnan(_971))), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.fp_t_tcb_8, spvDescriptorSet0.fp_t_tcb_8Smplr_w, select(_971, float2(0.0), isnan(_971))).x;
    float _74 = in.m_44.y;
    float _76 = in.m_44.x;
    float _78 = in.m_46.y;
    float _80 = in.m_48.y;
    float _82 = in.m_46.x;
    float _84 = in.m_48.x;
    float _86 = -_66;
    float _88 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _90 = fma(_86, (*spvDescriptorSet0.fp_c3)._m0[46].z, _88);
    float _92 = -_68;
    float _94 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _96 = fma(_92, (*spvDescriptorSet0.fp_c3)._m0[46].z, _94);
    float _98 = -_70;
    float _100 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _102 = fma(_98, (*spvDescriptorSet0.fp_c3)._m0[46].z, _100);
    float _104 = _74 * _90;
    float _106 = _76 * _90;
    float _108 = -_104;
    float _110 = fma(_96, _78, _108);
    float _112 = -_104;
    float _114 = fma(_102, _80, _112);
    float _116 = -_106;
    float _118 = fma(_96, _82, _116);
    float _120 = -_106;
    float _122 = fma(_102, _84, _120);
    float _124 = _110 * _110;
    float _126 = _114 * _114;
    float _128 = -_90;
    float _130 = _128 + _96;
    float _132 = -_90;
    float _134 = _132 + _102;
    float _136 = fma(_118, _118, _124);
    float _138 = fma(_122, _122, _126);
    float _140 = fma(_130, _130, _136);
    float _142 = fma(_134, _134, _138);
    float _144 = rsqrt(_140);
    float _146 = rsqrt(_142);
    float _148 = _118 * _144;
    float _150 = _130 * _144;
    float _152 = _110 * _144;
    float _154 = _134 * _146;
    float _156 = _114 * _146;
    float _158 = _122 * _146;
    float _160 = _148 * _154;
    float _162 = _150 * _156;
    float _164 = -_160;
    float _166 = fma(_150, _158, _164);
    float _168 = _152 * _158;
    float _170 = -_162;
    float _172 = fma(_152, _154, _170);
    float _174 = _166 * _166;
    float _176 = -_72;
    float _178 = -(*spvDescriptorSet0.fp_c3)._m0[46].y;
    float _180 = fma(_176, (*spvDescriptorSet0.fp_c3)._m0[46].z, _178);
    float _182 = -_168;
    float _184 = fma(_148, _156, _182);
    float _186 = fma(_172, _172, _174);
    float _188 = _180 * _76;
    float _190 = -_180;
    bool _194 = _190 > (*spvDescriptorSet0.fp_c3)._m0[40].x;
    float _196 = fma(_184, _184, _186);
    float _198 = -_180;
    bool _200 = _198 > (*spvDescriptorSet0.fp_c3)._m0[39].x;
    float _202 = _180 * _74;
    bool _204 = !_194;
    uint _207 = uint(_204 ? 0 : 1);
    float _209 = rsqrt(_196);
    uint _211 = 2u;
    if (!_194)
    {
        _211 = 1u;
    }
    uint _213 = _211;
    uint _215 = _213;
    if (!_200)
    {
        _215 = _207;
    }
    uint _217 = _215;
    uint _219 = min(_217, 2u);
    float _221 = _166 * _209;
    float _223 = _172 * _209;
    int _226 = int(_219) << 2;
    float _228 = _184 * _209;
    float _230 = _221 * (*spvDescriptorSet0.fp_c3)._m0[35].y;
    uint _232 = uint(int(uint(_226) >> uint(2)));
    uint _234 = uint(int(uint(int(_232)) >> uint(2)));
    int _236 = int(_232) & 3;
    float _238 = (*spvDescriptorSet0.fp_c1)._m0[int(_234)][_236];
    float _240 = fma(_223, (*spvDescriptorSet0.fp_c3)._m0[35].x, _230);
    float _242 = fma(_228, (*spvDescriptorSet0.fp_c3)._m0[35].z, _240);
    float _244 = abs(_242);
    float _246 = -_244;
    float _248 = _246 + 1.0;
    float _250 = precise::clamp(_248, 0.0, 1.0);
    float _252 = abs(_250);
    float _254 = log2(_252);
    float _256 = _254 * (*spvDescriptorSet0.fp_c3)._m0[48].z;
    float _258 = exp2(_256);
    float _260 = _258 * (*spvDescriptorSet0.fp_c3)._m0[48].y;
    float _262 = fma(_223, _260, _188);
    float _264 = fma(_221, _260, _202);
    float _266 = fma(_228, _260, _180);
    bool _268 = as_type<int>(_238) == 1216;
    if (!_268)
    {
        bool _270 = as_type<int>(_238) == 1488;
        _272 = _270;
        if (!_272)
        {
            _274 = true;
        }
    }
    float _308;
    float _310;
    float _312;
    float _314;
    if (!_272)
    {
        if (!_274)
        {
            float _276 = _264 * (*spvDescriptorSet0.fp_c3)._m0[0].y;
            float _278 = _264 * (*spvDescriptorSet0.fp_c3)._m0[1].y;
            float _280 = _264 * (*spvDescriptorSet0.fp_c3)._m0[2].y;
            float _282 = _264 * (*spvDescriptorSet0.fp_c3)._m0[3].y;
            float _284 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[0].x, _276);
            float _286 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[1].x, _278);
            float _288 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[2].x, _280);
            float _290 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[3].x, _282);
            float _292 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[0].z, _284);
            float _294 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[1].z, _286);
            float _296 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[2].z, _288);
            float _298 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[3].z, _290);
            float _300 = _292 + (*spvDescriptorSet0.fp_c3)._m0[0].w;
            float _302 = _294 + (*spvDescriptorSet0.fp_c3)._m0[1].w;
            float _304 = _296 + (*spvDescriptorSet0.fp_c3)._m0[2].w;
            float _306 = _298 + (*spvDescriptorSet0.fp_c3)._m0[3].w;
            _308 = _306;
            _310 = _302;
            _312 = _304;
            _314 = _300;
        }
    }
    if ((false || _274) || _272)
    {
        if ((!_274) || _272)
        {
            _272 = false;
            float _316 = _264 * (*spvDescriptorSet0.fp_c3)._m0[4].y;
            float _318 = _264 * (*spvDescriptorSet0.fp_c3)._m0[5].y;
            float _320 = _264 * (*spvDescriptorSet0.fp_c3)._m0[6].y;
            float _322 = _264 * (*spvDescriptorSet0.fp_c3)._m0[7].y;
            float _324 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[4].x, _316);
            float _326 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[5].x, _318);
            float _328 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[6].x, _320);
            float _330 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[7].x, _322);
            float _332 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[4].z, _324);
            float _334 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[5].z, _326);
            float _336 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[6].z, _328);
            float _338 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[7].z, _330);
            float _340 = _332 + (*spvDescriptorSet0.fp_c3)._m0[4].w;
            float _342 = _334 + (*spvDescriptorSet0.fp_c3)._m0[5].w;
            float _344 = _336 + (*spvDescriptorSet0.fp_c3)._m0[6].w;
            float _346 = _338 + (*spvDescriptorSet0.fp_c3)._m0[7].w;
            _308 = _346;
            _310 = _342;
            _312 = _344;
            _314 = _340;
        }
        if (false || _274)
        {
            _274 = false;
            float _348 = _264 * (*spvDescriptorSet0.fp_c3)._m0[8].y;
            float _350 = _264 * (*spvDescriptorSet0.fp_c3)._m0[9].y;
            float _352 = _264 * (*spvDescriptorSet0.fp_c3)._m0[10].y;
            float _354 = _264 * (*spvDescriptorSet0.fp_c3)._m0[11].y;
            float _356 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[8].x, _348);
            float _358 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[9].x, _350);
            float _360 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[10].x, _352);
            float _362 = fma(_262, (*spvDescriptorSet0.fp_c3)._m0[11].x, _354);
            float _364 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[8].z, _356);
            float _366 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[9].z, _358);
            float _368 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[10].z, _360);
            float _370 = fma(_266, (*spvDescriptorSet0.fp_c3)._m0[11].z, _362);
            float _372 = _364 + (*spvDescriptorSet0.fp_c3)._m0[8].w;
            float _374 = _366 + (*spvDescriptorSet0.fp_c3)._m0[9].w;
            float _376 = _368 + (*spvDescriptorSet0.fp_c3)._m0[10].w;
            float _378 = _370 + (*spvDescriptorSet0.fp_c3)._m0[11].w;
            _308 = _378;
            _310 = _374;
            _312 = _376;
            _314 = _372;
        }
    }
    float _380 = _308;
    float _382 = _310;
    float _384 = _312;
    float _386 = _314;
    float _388 = float(int(_217));
    float _390 = 1.0 / _380;
    float _392 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].y;
    float _394 = rint(_388);
    float _396 = precise::max(_394, 0.0);
    uint _398 = uint(_396);
    uint _400 = clamp(_398, 0u, 65535u);
    float _402 = _390 * _382;
    float _404 = _390 * _384;
    float _406 = precise::clamp(_404, 0.0, 1.0);
    float _408 = _390 * _386;
    float _410 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].x;
    float _412 = fma(_406, _392, _402);
    float _414 = fma(_406, _410, _408);
    float _416 = -_410;
    float _418 = fma(_406, _416, _408);
    float3 _1616 = float3(_408, _412, float(int(_400)));
    float3 _1620 = select(_1616, float3(0.0), isnan(_1616));
    float _420 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1620.xy, uint(rint(_1620.z)), _406);
    float3 _1629 = float3(_414, _412, float(int(_400)));
    float3 _1631 = select(_1629, float3(0.0), isnan(_1629));
    float _422 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1631.xy, uint(rint(_1631.z)), _406);
    float3 _1640 = float3(_418, _412, float(int(_400)));
    float3 _1642 = select(_1640, float3(0.0), isnan(_1640));
    float _424 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1642.xy, uint(rint(_1642.z)), _406);
    float3 _1651 = float3(_414, _402, float(int(_400)));
    float3 _1653 = select(_1651, float3(0.0), isnan(_1651));
    float _426 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1653.xy, uint(rint(_1653.z)), _406);
    float _428 = -_392;
    float _430 = fma(_406, _428, _402);
    float3 _1668 = float3(_408, _402, float(int(_400)));
    float3 _1670 = select(_1668, float3(0.0), isnan(_1668));
    float _432 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1670.xy, uint(rint(_1670.z)), _406);
    float3 _1679 = float3(_418, _402, float(int(_400)));
    float3 _1681 = select(_1679, float3(0.0), isnan(_1679));
    float _434 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1681.xy, uint(rint(_1681.z)), _406);
    float3 _1690 = float3(_414, _430, float(int(_400)));
    float3 _1692 = select(_1690, float3(0.0), isnan(_1690));
    float _436 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1692.xy, uint(rint(_1692.z)), _406);
    float3 _1701 = float3(_408, _430, float(int(_400)));
    float3 _1703 = select(_1701, float3(0.0), isnan(_1701));
    float _438 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1703.xy, uint(rint(_1703.z)), _406);
    float3 _1712 = float3(_418, _430, float(int(_400)));
    float3 _1714 = select(_1712, float3(0.0), isnan(_1712));
    float _440 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_E).sample_compare(spvDescriptorSet0.fp_t_tcb_ESmplr, _1714.xy, uint(rint(_1714.z)), _406);
    float _442 = -_202;
    float _444 = _442 + (*spvDescriptorSet0.fp_c3)._m0[42].y;
    float _446 = -_188;
    float _448 = _446 + (*spvDescriptorSet0.fp_c3)._m0[42].x;
    float _450 = _444 * _444;
    float _452 = fma(_448, _448, _450);
    float _454 = -_180;
    float _456 = _454 + (*spvDescriptorSet0.fp_c3)._m0[42].z;
    float _458 = fma(_456, _456, _452);
    float _460 = sqrt(_458);
    float _462 = _202 * (*spvDescriptorSet0.fp_c3)._m0[21].y;
    float _464 = _202 * (*spvDescriptorSet0.fp_c3)._m0[19].y;
    float _466 = _202 * (*spvDescriptorSet0.fp_c3)._m0[20].y;
    float _468 = _202 * (*spvDescriptorSet0.fp_c3)._m0[22].y;
    float _470 = _202 * (*spvDescriptorSet0.fp_c3)._m0[23].y;
    float _472 = _202 * (*spvDescriptorSet0.fp_c3)._m0[24].y;
    float _474 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[21].x, _462);
    float _476 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[19].x, _464);
    float _478 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[20].x, _466);
    float _480 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[22].x, _468);
    float _482 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[23].x, _470);
    float _484 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[24].x, _472);
    float _486 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[21].z, _474);
    float _488 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[19].z, _476);
    bool _490 = _460 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    float _492 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[20].z, _478);
    bool _494 = _460 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    float _496 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[22].z, _480);
    bool _498 = !_490;
    int _500 = _498 ? 0 : 1;
    float _502 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[23].z, _482);
    float _504 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[24].z, _484);
    float _506 = _492 + (*spvDescriptorSet0.fp_c3)._m0[20].w;
    float _508 = _202 * (*spvDescriptorSet0.fp_c3)._m0[17].y;
    float _510 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].z;
    float _512 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[17].x, _508);
    int _514 = 2;
    float _516 = _506;
    if (!_490)
    {
        _514 = 1;
    }
    int _518 = _514;
    int _520 = _518;
    if (!_494)
    {
        _520 = _500;
    }
    int _522 = _520;
    float _524 = _486 + (*spvDescriptorSet0.fp_c3)._m0[21].w;
    float _526 = _488 + (*spvDescriptorSet0.fp_c3)._m0[19].w;
    float _528 = _202 * (*spvDescriptorSet0.fp_c3)._m0[16].y;
    float _530 = float(_522);
    float _532 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[17].z, _512);
    float _534 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[16].x, _528);
    float _536 = precise::min(_530, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _538 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[16].z, _534);
    bool _540 = _536 != 1.0;
    bool _542 = isnan(_536);
    bool _544 = _540 || _542;
    bool _546 = isnan(1.0);
    bool _548 = _544 || _546;
    float _550 = _524;
    float _552 = _526;
    if (_548)
    {
        float _554 = _504 + (*spvDescriptorSet0.fp_c3)._m0[24].w;
        _550 = _554;
    }
    float _556 = _550;
    float _558 = _556;
    if (_548)
    {
        float _560 = _496 + (*spvDescriptorSet0.fp_c3)._m0[22].w;
        _552 = _560;
    }
    float _562 = _552;
    float _564 = _562;
    if (_548)
    {
        float _566 = _502 + (*spvDescriptorSet0.fp_c3)._m0[23].w;
        _516 = _566;
    }
    float _568 = _516;
    bool _570 = _536 != 0.0;
    bool _572 = isnan(_536);
    bool _574 = _570 || _572;
    bool _576 = isnan(0.0);
    bool _578 = _574 || _576;
    float _580 = _202 * (*spvDescriptorSet0.fp_c3)._m0[18].y;
    float _582 = rint(_536);
    float _584 = precise::max(_582, 0.0);
    uint _586 = uint(_584);
    uint _588 = clamp(_586, 0u, 65535u);
    float _590 = (*spvDescriptorSet0.fp_c3)._m0[47].x * (*spvDescriptorSet0.fp_c3)._m0[37].w;
    float _592 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[18].x, _580);
    float _594 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[18].z, _592);
    float _596 = _568;
    if (!_578)
    {
        float _598 = _594 + (*spvDescriptorSet0.fp_c3)._m0[18].w;
        _558 = _598;
    }
    float _600 = _558;
    if (!_578)
    {
        float _602 = _538 + (*spvDescriptorSet0.fp_c3)._m0[16].w;
        _564 = _602;
    }
    float _604 = _564;
    if (!_578)
    {
        float _606 = _532 + (*spvDescriptorSet0.fp_c3)._m0[17].w;
        _596 = _606;
    }
    float _608 = _596;
    float _610 = 0.0 + _600;
    float _612 = precise::clamp(_610, 0.0, 1.0);
    float _614 = fma(_612, _590, _608);
    float _616 = fma(_612, _510, _604);
    float _618 = -_510;
    float _620 = fma(_612, _618, _604);
    float _622 = _422 + _420;
    float _624 = _622 + _424;
    float _626 = _624 + _426;
    float3 _2064 = float3(_604, _614, float(int(_588)));
    float3 _2066 = select(_2064, float3(0.0), isnan(_2064));
    float _628 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2066.xy, uint(rint(_2066.z)), _612);
    float3 _2075 = float3(_616, _614, float(int(_588)));
    float3 _2077 = select(_2075, float3(0.0), isnan(_2075));
    float _630 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2077.xy, uint(rint(_2077.z)), _612);
    float3 _2086 = float3(_620, _614, float(int(_588)));
    float3 _2088 = select(_2086, float3(0.0), isnan(_2086));
    float _632 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2088.xy, uint(rint(_2088.z)), _612);
    float3 _2097 = float3(_616, _608, float(int(_588)));
    float3 _2099 = select(_2097, float3(0.0), isnan(_2097));
    float _634 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2099.xy, uint(rint(_2099.z)), _612);
    float _636 = _626 + _432;
    float _638 = _636 + _434;
    float _640 = _638 + _436;
    float _642 = -_590;
    float _644 = fma(_612, _642, _608);
    float3 _2123 = float3(_604, _608, float(int(_588)));
    float3 _2125 = select(_2123, float3(0.0), isnan(_2123));
    float _646 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2125.xy, uint(rint(_2125.z)), _612);
    float3 _2134 = float3(_620, _608, float(int(_588)));
    float3 _2136 = select(_2134, float3(0.0), isnan(_2134));
    float _648 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2136.xy, uint(rint(_2136.z)), _612);
    float _650 = _640 + _438;
    float3 _2148 = float3(_616, _644, float(int(_588)));
    float3 _2150 = select(_2148, float3(0.0), isnan(_2148));
    float _652 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2150.xy, uint(rint(_2150.z)), _612);
    float2 _2156 = float2(_58, _60);
    float2 _656 = dm_bs(spvDescriptorSet0.fp_t_tcb_C.sample(spvDescriptorSet0.fp_t_tcb_CSmplr, select(_2156, float2(0.0), isnan(_2156))), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.fp_t_tcb_C, spvDescriptorSet0.fp_t_tcb_CSmplr_w, select(_2156, float2(0.0), isnan(_2156))).xy;
    float _658 = _656.x;
    float _660 = _656.y;
    float3 _2171 = float3(_604, _644, float(int(_588)));
    float3 _2173 = select(_2171, float3(0.0), isnan(_2171));
    float _662 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2173.xy, uint(rint(_2173.z)), _612);
    float _664 = _202 * (*spvDescriptorSet0.fp_c3)._m0[26].y;
    float _666 = _202 * (*spvDescriptorSet0.fp_c3)._m0[27].y;
    float _668 = _650 + _440;
    float _670 = _202 * (*spvDescriptorSet0.fp_c3)._m0[28].y;
    float _672 = _202 * (*spvDescriptorSet0.fp_c3)._m0[29].y;
    float _674 = _202 * (*spvDescriptorSet0.fp_c3)._m0[31].y;
    float _676 = _202 * (*spvDescriptorSet0.fp_c3)._m0[32].y;
    float _678 = _202 * (*spvDescriptorSet0.fp_c3)._m0[33].y;
    float _680 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[27].x, _666);
    float _682 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[28].x, _670);
    float _684 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[32].x, _676);
    float _686 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[33].x, _678);
    float _688 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[27].z, _680);
    float _690 = -_188;
    float _692 = _690 + (*spvDescriptorSet0.fp_c3)._m0[43].x;
    float _694 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[26].x, _664);
    float _696 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[31].x, _674);
    float _698 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[28].z, _682);
    float _700 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[32].z, _684);
    float _702 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[26].z, _694);
    float _704 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[31].z, _696);
    float _706 = _630 + _628;
    float _708 = _706 + _632;
    float _710 = _202 * (*spvDescriptorSet0.fp_c3)._m0[25].y;
    float _712 = _202 * (*spvDescriptorSet0.fp_c3)._m0[30].y;
    float _714 = -_202;
    float _716 = _714 + (*spvDescriptorSet0.fp_c3)._m0[43].y;
    float _718 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[25].x, _710);
    float _720 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[29].x, _672);
    float _722 = _716 * _716;
    float _724 = fma(_188, (*spvDescriptorSet0.fp_c3)._m0[30].x, _712);
    float _726 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[29].z, _720);
    float _728 = fma(_692, _692, _722);
    float _730 = -_180;
    float _732 = _730 + (*spvDescriptorSet0.fp_c3)._m0[43].z;
    float _734 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[30].z, _724);
    float _736 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[25].z, _718);
    float _738 = fma(_732, _732, _728);
    float _740 = _734 + (*spvDescriptorSet0.fp_c3)._m0[30].w;
    float _742 = sqrt(_738);
    bool _744 = _742 > (*spvDescriptorSet0.fp_c3)._m0[45].x;
    bool _746 = _742 > (*spvDescriptorSet0.fp_c3)._m0[44].x;
    bool _748 = !_744;
    int _750 = _748 ? 0 : 1;
    int _752 = 2;
    float _754 = _740;
    if (!_744)
    {
        _752 = 1;
    }
    int _756 = _752;
    int _758 = _756;
    if (!_746)
    {
        _758 = _750;
    }
    int _760 = _758;
    float _762 = fma(_180, (*spvDescriptorSet0.fp_c3)._m0[33].z, _686);
    float _764 = _698 + (*spvDescriptorSet0.fp_c3)._m0[28].w;
    float _766 = float(_760);
    float _768 = precise::min(_766, (*spvDescriptorSet0.fp_c3)._m0[46].x);
    float _770 = _726 + (*spvDescriptorSet0.fp_c3)._m0[29].w;
    float _772 = _708 + _634;
    bool _774 = _768 != 1.0;
    bool _776 = isnan(_768);
    bool _778 = _774 || _776;
    bool _780 = isnan(1.0);
    bool _782 = _778 || _780;
    float _784 = _764;
    float _786 = _770;
    if (_782)
    {
        float _788 = _704 + (*spvDescriptorSet0.fp_c3)._m0[31].w;
        _784 = _788;
    }
    float _790 = _784;
    float _792 = _790;
    if (_782)
    {
        float _794 = _700 + (*spvDescriptorSet0.fp_c3)._m0[32].w;
        _786 = _794;
    }
    float _796 = _786;
    float _798 = _796;
    if (_782)
    {
        float _800 = _762 + (*spvDescriptorSet0.fp_c3)._m0[33].w;
        _754 = _800;
    }
    float _802 = _754;
    bool _804 = _768 != 0.0;
    bool _806 = isnan(_768);
    bool _808 = _804 || _806;
    bool _810 = isnan(0.0);
    bool _812 = _808 || _810;
    float _814 = rint(_768);
    float _816 = precise::max(_814, 0.0);
    uint _818 = uint(_816);
    uint _820 = clamp(_818, 0u, 65535u);
    float _822 = _802;
    if (!_812)
    {
        float _824 = _688 + (*spvDescriptorSet0.fp_c3)._m0[27].w;
        _822 = _824;
    }
    float _826 = _822;
    if (!_812)
    {
        float _828 = _736 + (*spvDescriptorSet0.fp_c3)._m0[25].w;
        _792 = _828;
    }
    float _830 = _792;
    if (!_812)
    {
        float _832 = _702 + (*spvDescriptorSet0.fp_c3)._m0[26].w;
        _798 = _832;
    }
    float _834 = _798;
    float _836 = 0.0 + _826;
    float _838 = precise::clamp(_836, 0.0, 1.0);
    float _840 = fma(_590, _838, _834);
    float _842 = fma(_510, _838, _830);
    float _844 = -_510;
    float _846 = fma(_844, _838, _830);
    float3 _2514 = float3(_620, _644, float(int(_588)));
    float3 _2516 = select(_2514, float3(0.0), isnan(_2514));
    float _848 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_10).sample_compare(spvDescriptorSet0.fp_t_tcb_10Smplr, _2516.xy, uint(rint(_2516.z)), _612);
    float3 _2525 = float3(_830, _840, float(int(_820)));
    float3 _2527 = select(_2525, float3(0.0), isnan(_2525));
    float _850 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2527.xy, uint(rint(_2527.z)), _838);
    float3 _2536 = float3(_842, _840, float(int(_820)));
    float3 _2538 = select(_2536, float3(0.0), isnan(_2536));
    float _852 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2538.xy, uint(rint(_2538.z)), _838);
    float3 _2547 = float3(_846, _840, float(int(_820)));
    float3 _2549 = select(_2547, float3(0.0), isnan(_2547));
    float _854 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2549.xy, uint(rint(_2549.z)), _838);
    float3 _2558 = float3(_842, _834, float(int(_820)));
    float3 _2560 = select(_2558, float3(0.0), isnan(_2558));
    float _856 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2560.xy, uint(rint(_2560.z)), _838);
    float _858 = _772 + _646;
    float _860 = fma(_660, 2.0, -1.0);
    float _862 = _858 + _648;
    float _864 = fma(_658, 2.0, -1.0);
    float _866 = _862 + _652;
    float _868 = _860 * (*spvDescriptorSet0.fp_c3)._m0[36].w;
    float _870 = -_590;
    float _872 = fma(_870, _838, _834);
    float _874 = fma(_868, 2.0, _60);
    float _876 = _864 * (*spvDescriptorSet0.fp_c3)._m0[36].z;
    float3 _2602 = float3(_830, _834, float(int(_820)));
    float3 _2604 = select(_2602, float3(0.0), isnan(_2602));
    float _878 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2604.xy, uint(rint(_2604.z)), _838);
    float3 _2613 = float3(_846, _834, float(int(_820)));
    float3 _2615 = select(_2613, float3(0.0), isnan(_2613));
    float _880 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2615.xy, uint(rint(_2615.z)), _838);
    float3 _2624 = float3(_842, _872, float(int(_820)));
    float3 _2626 = select(_2624, float3(0.0), isnan(_2624));
    float _882 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2626.xy, uint(rint(_2626.z)), _838);
    float _884 = fma(_876, 2.0, _58);
    float3 _2638 = float3(_830, _872, float(int(_820)));
    float3 _2640 = select(_2638, float3(0.0), isnan(_2638));
    float _886 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2640.xy, uint(rint(_2640.z)), _838);
    float3 _2649 = float3(_846, _872, float(int(_820)));
    float3 _2651 = select(_2649, float3(0.0), isnan(_2649));
    float _888 = spvDepthCast(spvDescriptorSet0.fp_t_tcb_12).sample_compare(spvDescriptorSet0.fp_t_tcb_12Smplr, _2651.xy, uint(rint(_2651.z)), _838);
    float2 _2657 = float2(_884, _874);
    float _890 = dm_bs(spvDescriptorSet0.fp_t_tcb_A.sample(spvDescriptorSet0.fp_t_tcb_ASmplr, select(_2657, float2(0.0), isnan(_2657))), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.fp_t_tcb_A, spvDescriptorSet0.fp_t_tcb_ASmplr_w, select(_2657, float2(0.0), isnan(_2657))).x;
    float _892 = _866 + _662;
    float _894 = _892 + _848;
    float _896 = _852 + _850;
    float _898 = _896 + _854;
    float _900 = _898 + _856;
    float _902 = _900 + _878;
    float _904 = _902 + _880;
    float _906 = _904 + _882;
    float _908 = _894 * 0.111111111938953399658203125;
    float _910 = _906 + _886;
    float _912 = -_180;
    float _914 = -(*spvDescriptorSet0.fp_c3)._m0[47].y;
    float _916 = _912 + _914;
    float _918 = -_180;
    float _920 = -(*spvDescriptorSet0.fp_c3)._m0[47].w;
    float _922 = _918 + _920;
    float _924 = _910 + _888;
    float _926 = _916 * (*spvDescriptorSet0.fp_c3)._m0[47].z;
    float _928 = precise::clamp(_926, 0.0, 1.0);
    float _930 = _924 * 0.111111111938953399658203125;
    float _932 = fma(_668, 0.111111111938953399658203125, _928);
    float _934 = _930 * (*spvDescriptorSet0.fp_c3)._m0[49].w;
    float _936 = fma(_908, (*spvDescriptorSet0.fp_c3)._m0[49].z, _934);
    float _938 = _922 * (*spvDescriptorSet0.fp_c3)._m0[48].x;
    float _940 = precise::clamp(_938, 0.0, 1.0);
    float _942 = _936 + _940;
    out.m_51.x = _890;
    out.m_51.y = _932;
    out.m_51.z = (*spvDescriptorSet0.fp_c3)._m0[34].z;
    out.m_51.w = _942;
    return out;
}

