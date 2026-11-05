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

struct _27
{
    uint _m0[1];
};

struct spvDescriptorSetBuffer0
{
    constant _16* vp_c0 [[id(0)]];
    constant _16* vp_c14 [[id(1)]];
    constant _16* vp_c9 [[id(2)]];
    constant _16* vp_c4 [[id(3)]];
    const device _27* vp_s0 [[id(4)]];
    texture2d<float> vp_t_tcb_8 [[id(5)]];
    sampler vp_t_tcb_8Smplr [[id(6)]];
    sampler vp_t_tcb_8Smplr_w [[id(7)]];
    constant dm_border_t* dm_border [[id(8)]];
};

struct main0_out
{
    float4 m_46 [[user(locn0)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_43 [[attribute(0)]];
};

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(int(gl_InstanceIndex));
    float _62 = as_type<float>(int(gl_BaseInstance));
    int _65 = as_type<int>(_60) - as_type<int>(_62);
    int _67 = _65 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _69 = _67 << 6;
    uint _72 = uint(int(uint(_69) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_72)];
    float _74 = as_type<float>(_dmw0.x);
    int _76 = _69 + 4;
    uint _78 = uint(int(uint(_76) >> uint(2)));
    float _80 = as_type<float>(_dmw0.y);
    int _82 = _69 + 8;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    float _86 = as_type<float>(_dmw0.z);
    int _88 = _69 + 12;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw0.w);
    float _94 = -(*spvDescriptorSet0.vp_c14)._m0[4].x;
    float _96 = _74 + _94;
    float _98 = -(*spvDescriptorSet0.vp_c14)._m0[4].y;
    float _100 = _86 + _98;
    float _102 = _96 * 0.015625;
    float _104 = _100 * 0.015625;
    float2 _647 = float2(_102, _104);
    float _106 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_647, float2(0.0), isnan(_647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_647, float2(0.0), isnan(_647)), level(0.0)).x;
    int _108 = _69 + 16;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_110)];
    float _112 = as_type<float>(_dmw1.x);
    int _114 = _108 + 4;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw1.y);
    int _120 = _108 + 8;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.z);
    int _126 = _108 + 12;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.w);
    int _132 = _69 + 32;
    int _134 = _69 + 40;
    int _136 = _69 + 52;
    uint _138 = uint(int(uint(_132) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw2.x);
    int _142 = _132 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.y);
    uint _148 = uint(int(uint(_134) >> uint(2)));
    float _150 = as_type<float>(_dmw2.z);
    int _152 = _134 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.w);
    uint _158 = uint(int(uint(_136) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_158)]);
    float _162 = (*spvDescriptorSet0.vp_c14)._m0[2].z * (*spvDescriptorSet0.vp_c14)._m0[1].x;
    int _164 = _69 + 48;
    float _166 = (*spvDescriptorSet0.vp_c14)._m0[1].z * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _168 = -_162;
    float _170 = fma((*spvDescriptorSet0.vp_c14)._m0[1].z, (*spvDescriptorSet0.vp_c14)._m0[2].x, _168);
    float _172 = (*spvDescriptorSet0.vp_c14)._m0[1].y * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _174 = -_166;
    float _176 = fma((*spvDescriptorSet0.vp_c14)._m0[1].y, (*spvDescriptorSet0.vp_c14)._m0[2].z, _174);
    float _178 = _170 * _170;
    uint _180 = uint(int(uint(_164) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_180)]);
    float _184 = -_172;
    float _186 = fma((*spvDescriptorSet0.vp_c14)._m0[1].x, (*spvDescriptorSet0.vp_c14)._m0[2].y, _184);
    bool _190 = _92 <= 0.5;
    bool _192 = isnan(_92);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.5);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = fma(_176, _176, _178);
    float _204 = in.m_43.x;
    float _206 = in.m_43.y;
    float _208 = in.m_43.z;
    float _210 = in.m_43.w;
    float _212 = fma(_186, _186, _202);
    float _214 = rsqrt(_212);
    float _216 = -_210;
    float _218 = _216 + 1.0;
    float _220 = -_118;
    float _222 = fma(_170, _214, _220);
    float _224 = -_112;
    float _226 = fma(_176, _214, _224);
    float _228 = -_124;
    float _230 = fma(_186, _214, _228);
    float _232 = fma(_218, _222, _118);
    float _234 = fma(_218, _226, _112);
    float _236 = fma(_218, _230, _124);
    float _238 = _232 * _232;
    float _240 = fma(_150, _204, _140);
    float _242 = fma(_234, _234, _238);
    float _244 = _160 * _240;
    float _246 = fma(_236, _236, _242);
    float _248 = rsqrt(_246);
    float _250 = _236 * _248;
    float _252 = _232 * _248;
    float _254 = _234 * _248;
    float _256 = fma(_156, _206, _146);
    float _258 = _250 * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _260 = _252 * (*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _262 = _160 * _256;
    float _264 = -_258;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c14)._m0[2].z, _264);
    float _268 = _254 * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _270 = -_260;
    float _272 = fma(_250, (*spvDescriptorSet0.vp_c14)._m0[2].y, _270);
    float _274 = _266 * _266;
    float _276 = -_268;
    float _278 = fma(_252, (*spvDescriptorSet0.vp_c14)._m0[2].x, _276);
    float _280 = fma(_272, _272, _274);
    float _282 = fma(_278, _278, _280);
    float _284 = rsqrt(_282);
    float _286 = _266 * _284;
    float _288 = _278 * _284;
    float _290 = _272 * _284;
    float _292 = _250 * _286;
    float _294 = _254 * _288;
    float _296 = -_292;
    float _298 = fma(_252, _288, _296);
    float _300 = fma(_208, -2.0, 1.0);
    float _302 = -_294;
    float _304 = fma(_250, _290, _302);
    float _306 = _252 * _290;
    float _308 = _262 * _252;
    float _310 = _262 * _250;
    float _312 = _262 * _254;
    float _314 = -_306;
    float _316 = fma(_254, _286, _314);
    float _318 = fma(_244, _304, _308);
    float _320 = fma(_200, _300, _208);
    float _322 = fma(_244, _298, _312);
    float _324 = _106 * (*spvDescriptorSet0.vp_c14)._m0[3].y;
    float _326 = _318 * _318;
    float _328 = fma(_244, _316, _310);
    float _330 = -_130;
    float _332 = _330 + 1.0;
    float _334 = _218 * _324;
    float _336 = fma(_322, _322, _326);
    float _338 = fma(_334, (*spvDescriptorSet0.vp_c14)._m0[5].x, _322);
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c14)._m0[5].y, _328);
    float _342 = fma(_328, _328, _336);
    float _344 = fma(_338, _338, _326);
    float _346 = fma(_340, _340, _344);
    float _348 = sqrt(_342);
    float _350 = rsqrt(_346);
    float _352 = _348 * _350;
    float _354 = fma(_340, _352, _86);
    float _356 = fma(_338, _352, _74);
    float _358 = fma(_318, _352, _80);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _362 = _354 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _366 = _356 + _364;
    float _368 = _358 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _370 = _362 * _362;
    float _372 = fma(_366, _366, _370);
    float _374 = sqrt(_372);
    bool _376 = _374 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _380 = _374 + _378;
    float _382 = _348;
    float _384 = _328;
    float _386 = _380;
    float _388 = _156;
    float _390 = _318;
    float _392 = _358;
    float _394 = _372;
    float _396 = _356;
    if (_376)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _382 = _398;
    }
    float _400 = _382;
    if (_376)
    {
        float _402 = rsqrt(_372);
        _384 = _402;
    }
    float _404 = _384;
    float _406 = _400;
    if (_376)
    {
        float _408 = _380 * _400;
        _386 = _408;
    }
    float _410 = _386;
    if (_376)
    {
        float _412 = _358 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _406 = _412;
    }
    float _414 = _406;
    float _416 = _414;
    if (_376)
    {
        float _418 = _410 * 0.15915493667125701904296875;
        _388 = _418;
    }
    float _420 = _388;
    float _422 = _350;
    if (_376)
    {
        float _424 = _420 * 6.283185482025146484375;
        float _426 = cos(_424);
        _422 = _426;
    }
    float _428 = _422;
    float _430 = _410;
    if (_376)
    {
        float _432 = _420 * 6.283185482025146484375;
        float _434 = sin(_432);
        _430 = _434;
    }
    float _436 = _430;
    if (_376)
    {
        float _438 = _428 + (-1.0);
        _390 = _438;
    }
    float _440 = _390;
    float _442 = _440;
    if (_376)
    {
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _442 = _444;
    }
    float _446 = _442;
    if (_376)
    {
        float _448 = fma(_436, _414, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _416 = _448;
    }
    float _450 = _416;
    float _452 = _450;
    if (_376)
    {
        float _454 = fma(_358, _428, _446);
        _392 = _454;
    }
    float _456 = _392;
    float _458 = fma(_356, (*spvDescriptorSet0.vp_c4)._m0[2].x, _368);
    float _460 = _458;
    if (_376)
    {
        float _462 = _404 * _450;
        _394 = _462;
    }
    float _464 = _394;
    if (_376)
    {
        float _466 = _456 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _452 = _466;
    }
    float _468 = _452;
    float _470 = _456 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _472 = _456 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _474 = _468;
    if (_376)
    {
        float _476 = fma(_366, _464, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _396 = _476;
    }
    float _478 = _396;
    float _480 = fma(_354, (*spvDescriptorSet0.vp_c4)._m0[2].z, _458);
    if (!_376)
    {
        _460 = _354;
    }
    float _482 = _460;
    float _484 = _482;
    if (_376)
    {
        float _486 = fma(_362, _464, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _484 = _486;
    }
    float _488 = _484;
    float _490 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[1].x, _472);
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[0].x, _470);
    if (_376)
    {
        float _494 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[2].x, _468);
        _474 = _494;
    }
    float _496 = _474;
    float _498 = _480 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[1].z, _490);
    float _502 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[0].z, _492);
    float _504 = _496;
    float _506 = _498;
    if (_376)
    {
        float _508 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[2].z, _496);
        _504 = _508;
    }
    float _510 = _504;
    float _512 = _500 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _514 = _502 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    if (_376)
    {
        float _516 = _510 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _506 = _516;
    }
    float _518 = _506;
    float _520 = precise::max(_332, 0.100000001490116119384765625);
    float _522 = _512 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _524 = _512 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _526 = _512 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _528 = _512 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _530 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[8].x, _522);
    float _532 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[7].x, _524);
    float _534 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[9].x, _526);
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[10].x, _528);
    float _538 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[8].z, _530);
    float _540 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[7].z, _532);
    float _542 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[9].z, _534);
    float _544 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[10].z, _536);
    float _546 = _538 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _548 = _540 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _550 = _542 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _552 = _544 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _320;
    out.m_46.y = _210;
    out.m_46.z = _520;
    out.m_46.w = _182;
    out.gl_Position.x = _548;
    out.gl_Position.y = _546;
    out.gl_Position.z = _550;
    out.gl_Position.w = _552;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]])
{
    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(int(gl_InstanceIndex));
    float _62 = as_type<float>(int(gl_BaseInstance));
    int _65 = as_type<int>(_60) - as_type<int>(_62);
    int _67 = _65 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _69 = _67 << 6;
    uint _72 = uint(int(uint(_69) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_72)];
    float _74 = as_type<float>(_dmw0.x);
    int _76 = _69 + 4;
    uint _78 = uint(int(uint(_76) >> uint(2)));
    float _80 = as_type<float>(_dmw0.y);
    int _82 = _69 + 8;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    float _86 = as_type<float>(_dmw0.z);
    int _88 = _69 + 12;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw0.w);
    float _94 = -(*spvDescriptorSet0.vp_c14)._m0[4].x;
    float _96 = _74 + _94;
    float _98 = -(*spvDescriptorSet0.vp_c14)._m0[4].y;
    float _100 = _86 + _98;
    float _102 = _96 * 0.015625;
    float _104 = _100 * 0.015625;
    float2 _647 = float2(_102, _104);
    float _106 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_647, float2(0.0), isnan(_647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_647, float2(0.0), isnan(_647)), level(0.0)).x;
    int _108 = _69 + 16;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_110)];
    float _112 = as_type<float>(_dmw1.x);
    int _114 = _108 + 4;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw1.y);
    int _120 = _108 + 8;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.z);
    int _126 = _108 + 12;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.w);
    int _132 = _69 + 32;
    int _134 = _69 + 40;
    int _136 = _69 + 52;
    uint _138 = uint(int(uint(_132) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw2.x);
    int _142 = _132 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.y);
    uint _148 = uint(int(uint(_134) >> uint(2)));
    float _150 = as_type<float>(_dmw2.z);
    int _152 = _134 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.w);
    uint _158 = uint(int(uint(_136) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_158)]);
    float _162 = (*spvDescriptorSet0.vp_c14)._m0[2].z * (*spvDescriptorSet0.vp_c14)._m0[1].x;
    int _164 = _69 + 48;
    float _166 = (*spvDescriptorSet0.vp_c14)._m0[1].z * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _168 = -_162;
    float _170 = fma((*spvDescriptorSet0.vp_c14)._m0[1].z, (*spvDescriptorSet0.vp_c14)._m0[2].x, _168);
    float _172 = (*spvDescriptorSet0.vp_c14)._m0[1].y * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _174 = -_166;
    float _176 = fma((*spvDescriptorSet0.vp_c14)._m0[1].y, (*spvDescriptorSet0.vp_c14)._m0[2].z, _174);
    float _178 = _170 * _170;
    uint _180 = uint(int(uint(_164) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_180)]);
    float _184 = -_172;
    float _186 = fma((*spvDescriptorSet0.vp_c14)._m0[1].x, (*spvDescriptorSet0.vp_c14)._m0[2].y, _184);
    bool _190 = _92 <= 0.5;
    bool _192 = isnan(_92);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.5);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = fma(_176, _176, _178);
    float _204 = in.m_43.x;
    float _206 = in.m_43.y;
    float _208 = in.m_43.z;
    float _210 = in.m_43.w;
    float _212 = fma(_186, _186, _202);
    float _214 = rsqrt(_212);
    float _216 = -_210;
    float _218 = _216 + 1.0;
    float _220 = -_118;
    float _222 = fma(_170, _214, _220);
    float _224 = -_112;
    float _226 = fma(_176, _214, _224);
    float _228 = -_124;
    float _230 = fma(_186, _214, _228);
    float _232 = fma(_218, _222, _118);
    float _234 = fma(_218, _226, _112);
    float _236 = fma(_218, _230, _124);
    float _238 = _232 * _232;
    float _240 = fma(_150, _204, _140);
    float _242 = fma(_234, _234, _238);
    float _244 = _160 * _240;
    float _246 = fma(_236, _236, _242);
    float _248 = rsqrt(_246);
    float _250 = _236 * _248;
    float _252 = _232 * _248;
    float _254 = _234 * _248;
    float _256 = fma(_156, _206, _146);
    float _258 = _250 * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _260 = _252 * (*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _262 = _160 * _256;
    float _264 = -_258;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c14)._m0[2].z, _264);
    float _268 = _254 * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _270 = -_260;
    float _272 = fma(_250, (*spvDescriptorSet0.vp_c14)._m0[2].y, _270);
    float _274 = _266 * _266;
    float _276 = -_268;
    float _278 = fma(_252, (*spvDescriptorSet0.vp_c14)._m0[2].x, _276);
    float _280 = fma(_272, _272, _274);
    float _282 = fma(_278, _278, _280);
    float _284 = rsqrt(_282);
    float _286 = _266 * _284;
    float _288 = _278 * _284;
    float _290 = _272 * _284;
    float _292 = _250 * _286;
    float _294 = _254 * _288;
    float _296 = -_292;
    float _298 = fma(_252, _288, _296);
    float _300 = fma(_208, -2.0, 1.0);
    float _302 = -_294;
    float _304 = fma(_250, _290, _302);
    float _306 = _252 * _290;
    float _308 = _262 * _252;
    float _310 = _262 * _250;
    float _312 = _262 * _254;
    float _314 = -_306;
    float _316 = fma(_254, _286, _314);
    float _318 = fma(_244, _304, _308);
    float _320 = fma(_200, _300, _208);
    float _322 = fma(_244, _298, _312);
    float _324 = _106 * (*spvDescriptorSet0.vp_c14)._m0[3].y;
    float _326 = _318 * _318;
    float _328 = fma(_244, _316, _310);
    float _330 = -_130;
    float _332 = _330 + 1.0;
    float _334 = _218 * _324;
    float _336 = fma(_322, _322, _326);
    float _338 = fma(_334, (*spvDescriptorSet0.vp_c14)._m0[5].x, _322);
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c14)._m0[5].y, _328);
    float _342 = fma(_328, _328, _336);
    float _344 = fma(_338, _338, _326);
    float _346 = fma(_340, _340, _344);
    float _348 = sqrt(_342);
    float _350 = rsqrt(_346);
    float _352 = _348 * _350;
    float _354 = fma(_340, _352, _86);
    float _356 = fma(_338, _352, _74);
    float _358 = fma(_318, _352, _80);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _362 = _354 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _366 = _356 + _364;
    float _368 = _358 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _370 = _362 * _362;
    float _372 = fma(_366, _366, _370);
    float _374 = sqrt(_372);
    bool _376 = _374 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _380 = _374 + _378;
    float _382 = _348;
    float _384 = _328;
    float _386 = _380;
    float _388 = _156;
    float _390 = _318;
    float _392 = _358;
    float _394 = _372;
    float _396 = _356;
    if (_376)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _382 = _398;
    }
    float _400 = _382;
    if (_376)
    {
        float _402 = rsqrt(_372);
        _384 = _402;
    }
    float _404 = _384;
    float _406 = _400;
    if (_376)
    {
        float _408 = _380 * _400;
        _386 = _408;
    }
    float _410 = _386;
    if (_376)
    {
        float _412 = _358 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _406 = _412;
    }
    float _414 = _406;
    float _416 = _414;
    if (_376)
    {
        float _418 = _410 * 0.15915493667125701904296875;
        _388 = _418;
    }
    float _420 = _388;
    float _422 = _350;
    if (_376)
    {
        float _424 = _420 * 6.283185482025146484375;
        float _426 = cos(_424);
        _422 = _426;
    }
    float _428 = _422;
    float _430 = _410;
    if (_376)
    {
        float _432 = _420 * 6.283185482025146484375;
        float _434 = sin(_432);
        _430 = _434;
    }
    float _436 = _430;
    if (_376)
    {
        float _438 = _428 + (-1.0);
        _390 = _438;
    }
    float _440 = _390;
    float _442 = _440;
    if (_376)
    {
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _442 = _444;
    }
    float _446 = _442;
    if (_376)
    {
        float _448 = fma(_436, _414, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _416 = _448;
    }
    float _450 = _416;
    float _452 = _450;
    if (_376)
    {
        float _454 = fma(_358, _428, _446);
        _392 = _454;
    }
    float _456 = _392;
    float _458 = fma(_356, (*spvDescriptorSet0.vp_c4)._m0[2].x, _368);
    float _460 = _458;
    if (_376)
    {
        float _462 = _404 * _450;
        _394 = _462;
    }
    float _464 = _394;
    if (_376)
    {
        float _466 = _456 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _452 = _466;
    }
    float _468 = _452;
    float _470 = _456 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _472 = _456 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _474 = _468;
    if (_376)
    {
        float _476 = fma(_366, _464, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _396 = _476;
    }
    float _478 = _396;
    float _480 = fma(_354, (*spvDescriptorSet0.vp_c4)._m0[2].z, _458);
    if (!_376)
    {
        _460 = _354;
    }
    float _482 = _460;
    float _484 = _482;
    if (_376)
    {
        float _486 = fma(_362, _464, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _484 = _486;
    }
    float _488 = _484;
    float _490 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[1].x, _472);
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[0].x, _470);
    if (_376)
    {
        float _494 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[2].x, _468);
        _474 = _494;
    }
    float _496 = _474;
    float _498 = _480 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[1].z, _490);
    float _502 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[0].z, _492);
    float _504 = _496;
    float _506 = _498;
    if (_376)
    {
        float _508 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[2].z, _496);
        _504 = _508;
    }
    float _510 = _504;
    float _512 = _500 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _514 = _502 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    if (_376)
    {
        float _516 = _510 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _506 = _516;
    }
    float _518 = _506;
    float _520 = precise::max(_332, 0.100000001490116119384765625);
    float _522 = _512 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _524 = _512 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _526 = _512 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _528 = _512 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _530 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[8].x, _522);
    float _532 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[7].x, _524);
    float _534 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[9].x, _526);
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[10].x, _528);
    float _538 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[8].z, _530);
    float _540 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[7].z, _532);
    float _542 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[9].z, _534);
    float _544 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[10].z, _536);
    float _546 = _538 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _548 = _540 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _550 = _542 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _552 = _544 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _320;
    out.m_46.y = _210;
    out.m_46.z = _520;
    out.m_46.w = _182;
    out.gl_Position.x = _548;
    out.gl_Position.y = _546;
    out.gl_Position.z = _550;
    out.gl_Position.w = _552;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint gl_InstanceIndex [[instance_id]], uint gl_BaseInstance [[base_instance]], uint dm_vid [[vertex_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint dm_iid = gl_InstanceIndex;
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_46 = float4(0.0, 0.0, 0.0, 1.0);
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _60 = as_type<float>(int(gl_InstanceIndex));
    float _62 = as_type<float>(int(gl_BaseInstance));
    int _65 = as_type<int>(_60) - as_type<int>(_62);
    int _67 = _65 + as_type<int>(as_type<float>(gl_BaseInstance));
    int _69 = _67 << 6;
    uint _72 = uint(int(uint(_69) >> uint(2)));
    packed_uint4 _dmw0 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_72)];
    float _74 = as_type<float>(_dmw0.x);
    int _76 = _69 + 4;
    uint _78 = uint(int(uint(_76) >> uint(2)));
    float _80 = as_type<float>(_dmw0.y);
    int _82 = _69 + 8;
    uint _84 = uint(int(uint(_82) >> uint(2)));
    float _86 = as_type<float>(_dmw0.z);
    int _88 = _69 + 12;
    uint _90 = uint(int(uint(_88) >> uint(2)));
    float _92 = as_type<float>(_dmw0.w);
    float _94 = -(*spvDescriptorSet0.vp_c14)._m0[4].x;
    float _96 = _74 + _94;
    float _98 = -(*spvDescriptorSet0.vp_c14)._m0[4].y;
    float _100 = _86 + _98;
    float _102 = _96 * 0.015625;
    float _104 = _100 * 0.015625;
    float2 _647 = float2(_102, _104);
    float _106 = dm_bs(spvDescriptorSet0.vp_t_tcb_8.sample(spvDescriptorSet0.vp_t_tcb_8Smplr, select(_647, float2(0.0), isnan(_647)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_8, spvDescriptorSet0.vp_t_tcb_8Smplr_w, select(_647, float2(0.0), isnan(_647)), level(0.0)).x;
    int _108 = _69 + 16;
    uint _110 = uint(int(uint(_108) >> uint(2)));
    packed_uint4 _dmw1 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_110)];
    float _112 = as_type<float>(_dmw1.x);
    int _114 = _108 + 4;
    uint _116 = uint(int(uint(_114) >> uint(2)));
    float _118 = as_type<float>(_dmw1.y);
    int _120 = _108 + 8;
    uint _122 = uint(int(uint(_120) >> uint(2)));
    float _124 = as_type<float>(_dmw1.z);
    int _126 = _108 + 12;
    uint _128 = uint(int(uint(_126) >> uint(2)));
    float _130 = as_type<float>(_dmw1.w);
    int _132 = _69 + 32;
    int _134 = _69 + 40;
    int _136 = _69 + 52;
    uint _138 = uint(int(uint(_132) >> uint(2)));
    packed_uint4 _dmw2 = *(const device packed_uint4*)&(*spvDescriptorSet0.vp_s0)._m0[int(_138)];
    float _140 = as_type<float>(_dmw2.x);
    int _142 = _132 + 4;
    uint _144 = uint(int(uint(_142) >> uint(2)));
    float _146 = as_type<float>(_dmw2.y);
    uint _148 = uint(int(uint(_134) >> uint(2)));
    float _150 = as_type<float>(_dmw2.z);
    int _152 = _134 + 4;
    uint _154 = uint(int(uint(_152) >> uint(2)));
    float _156 = as_type<float>(_dmw2.w);
    uint _158 = uint(int(uint(_136) >> uint(2)));
    float _160 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_158)]);
    float _162 = (*spvDescriptorSet0.vp_c14)._m0[2].z * (*spvDescriptorSet0.vp_c14)._m0[1].x;
    int _164 = _69 + 48;
    float _166 = (*spvDescriptorSet0.vp_c14)._m0[1].z * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _168 = -_162;
    float _170 = fma((*spvDescriptorSet0.vp_c14)._m0[1].z, (*spvDescriptorSet0.vp_c14)._m0[2].x, _168);
    float _172 = (*spvDescriptorSet0.vp_c14)._m0[1].y * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _174 = -_166;
    float _176 = fma((*spvDescriptorSet0.vp_c14)._m0[1].y, (*spvDescriptorSet0.vp_c14)._m0[2].z, _174);
    float _178 = _170 * _170;
    uint _180 = uint(int(uint(_164) >> uint(2)));
    float _182 = as_type<float>((*spvDescriptorSet0.vp_s0)._m0[int(_180)]);
    float _184 = -_172;
    float _186 = fma((*spvDescriptorSet0.vp_c14)._m0[1].x, (*spvDescriptorSet0.vp_c14)._m0[2].y, _184);
    bool _190 = _92 <= 0.5;
    bool _192 = isnan(_92);
    bool _194 = _190 || _192;
    bool _196 = isnan(0.5);
    bool _198 = _194 || _196;
    float _200 = float(_198);
    float _202 = fma(_176, _176, _178);
    float _204 = in.m_43.x;
    float _206 = in.m_43.y;
    float _208 = in.m_43.z;
    float _210 = in.m_43.w;
    float _212 = fma(_186, _186, _202);
    float _214 = rsqrt(_212);
    float _216 = -_210;
    float _218 = _216 + 1.0;
    float _220 = -_118;
    float _222 = fma(_170, _214, _220);
    float _224 = -_112;
    float _226 = fma(_176, _214, _224);
    float _228 = -_124;
    float _230 = fma(_186, _214, _228);
    float _232 = fma(_218, _222, _118);
    float _234 = fma(_218, _226, _112);
    float _236 = fma(_218, _230, _124);
    float _238 = _232 * _232;
    float _240 = fma(_150, _204, _140);
    float _242 = fma(_234, _234, _238);
    float _244 = _160 * _240;
    float _246 = fma(_236, _236, _242);
    float _248 = rsqrt(_246);
    float _250 = _236 * _248;
    float _252 = _232 * _248;
    float _254 = _234 * _248;
    float _256 = fma(_156, _206, _146);
    float _258 = _250 * (*spvDescriptorSet0.vp_c14)._m0[2].x;
    float _260 = _252 * (*spvDescriptorSet0.vp_c14)._m0[2].z;
    float _262 = _160 * _256;
    float _264 = -_258;
    float _266 = fma(_254, (*spvDescriptorSet0.vp_c14)._m0[2].z, _264);
    float _268 = _254 * (*spvDescriptorSet0.vp_c14)._m0[2].y;
    float _270 = -_260;
    float _272 = fma(_250, (*spvDescriptorSet0.vp_c14)._m0[2].y, _270);
    float _274 = _266 * _266;
    float _276 = -_268;
    float _278 = fma(_252, (*spvDescriptorSet0.vp_c14)._m0[2].x, _276);
    float _280 = fma(_272, _272, _274);
    float _282 = fma(_278, _278, _280);
    float _284 = rsqrt(_282);
    float _286 = _266 * _284;
    float _288 = _278 * _284;
    float _290 = _272 * _284;
    float _292 = _250 * _286;
    float _294 = _254 * _288;
    float _296 = -_292;
    float _298 = fma(_252, _288, _296);
    float _300 = fma(_208, -2.0, 1.0);
    float _302 = -_294;
    float _304 = fma(_250, _290, _302);
    float _306 = _252 * _290;
    float _308 = _262 * _252;
    float _310 = _262 * _250;
    float _312 = _262 * _254;
    float _314 = -_306;
    float _316 = fma(_254, _286, _314);
    float _318 = fma(_244, _304, _308);
    float _320 = fma(_200, _300, _208);
    float _322 = fma(_244, _298, _312);
    float _324 = _106 * (*spvDescriptorSet0.vp_c14)._m0[3].y;
    float _326 = _318 * _318;
    float _328 = fma(_244, _316, _310);
    float _330 = -_130;
    float _332 = _330 + 1.0;
    float _334 = _218 * _324;
    float _336 = fma(_322, _322, _326);
    float _338 = fma(_334, (*spvDescriptorSet0.vp_c14)._m0[5].x, _322);
    float _340 = fma(_334, (*spvDescriptorSet0.vp_c14)._m0[5].y, _328);
    float _342 = fma(_328, _328, _336);
    float _344 = fma(_338, _338, _326);
    float _346 = fma(_340, _340, _344);
    float _348 = sqrt(_342);
    float _350 = rsqrt(_346);
    float _352 = _348 * _350;
    float _354 = fma(_340, _352, _86);
    float _356 = fma(_338, _352, _74);
    float _358 = fma(_318, _352, _80);
    float _360 = -(*spvDescriptorSet0.vp_c9)._m0[26].z;
    float _362 = _354 + _360;
    float _364 = -(*spvDescriptorSet0.vp_c9)._m0[26].x;
    float _366 = _356 + _364;
    float _368 = _358 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
    float _370 = _362 * _362;
    float _372 = fma(_366, _366, _370);
    float _374 = sqrt(_372);
    bool _376 = _374 > (*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _378 = -(*spvDescriptorSet0.vp_c9)._m0[42].y;
    float _380 = _374 + _378;
    float _382 = _348;
    float _384 = _328;
    float _386 = _380;
    float _388 = _156;
    float _390 = _318;
    float _392 = _358;
    float _394 = _372;
    float _396 = _356;
    if (_376)
    {
        float _398 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _382 = _398;
    }
    float _400 = _382;
    if (_376)
    {
        float _402 = rsqrt(_372);
        _384 = _402;
    }
    float _404 = _384;
    float _406 = _400;
    if (_376)
    {
        float _408 = _380 * _400;
        _386 = _408;
    }
    float _410 = _386;
    if (_376)
    {
        float _412 = _358 + (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _406 = _412;
    }
    float _414 = _406;
    float _416 = _414;
    if (_376)
    {
        float _418 = _410 * 0.15915493667125701904296875;
        _388 = _418;
    }
    float _420 = _388;
    float _422 = _350;
    if (_376)
    {
        float _424 = _420 * 6.283185482025146484375;
        float _426 = cos(_424);
        _422 = _426;
    }
    float _428 = _422;
    float _430 = _410;
    if (_376)
    {
        float _432 = _420 * 6.283185482025146484375;
        float _434 = sin(_432);
        _430 = _434;
    }
    float _436 = _430;
    if (_376)
    {
        float _438 = _428 + (-1.0);
        _390 = _438;
    }
    float _440 = _390;
    float _442 = _440;
    if (_376)
    {
        float _444 = _440 * (*spvDescriptorSet0.vp_c9)._m0[42].z;
        _442 = _444;
    }
    float _446 = _442;
    if (_376)
    {
        float _448 = fma(_436, _414, (*spvDescriptorSet0.vp_c9)._m0[42].y);
        _416 = _448;
    }
    float _450 = _416;
    float _452 = _450;
    if (_376)
    {
        float _454 = fma(_358, _428, _446);
        _392 = _454;
    }
    float _456 = _392;
    float _458 = fma(_356, (*spvDescriptorSet0.vp_c4)._m0[2].x, _368);
    float _460 = _458;
    if (_376)
    {
        float _462 = _404 * _450;
        _394 = _462;
    }
    float _464 = _394;
    if (_376)
    {
        float _466 = _456 * (*spvDescriptorSet0.vp_c4)._m0[2].y;
        _452 = _466;
    }
    float _468 = _452;
    float _470 = _456 * (*spvDescriptorSet0.vp_c4)._m0[0].y;
    float _472 = _456 * (*spvDescriptorSet0.vp_c4)._m0[1].y;
    float _474 = _468;
    if (_376)
    {
        float _476 = fma(_366, _464, (*spvDescriptorSet0.vp_c9)._m0[26].x);
        _396 = _476;
    }
    float _478 = _396;
    float _480 = fma(_354, (*spvDescriptorSet0.vp_c4)._m0[2].z, _458);
    if (!_376)
    {
        _460 = _354;
    }
    float _482 = _460;
    float _484 = _482;
    if (_376)
    {
        float _486 = fma(_362, _464, (*spvDescriptorSet0.vp_c9)._m0[26].z);
        _484 = _486;
    }
    float _488 = _484;
    float _490 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[1].x, _472);
    float _492 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[0].x, _470);
    if (_376)
    {
        float _494 = fma(_478, (*spvDescriptorSet0.vp_c4)._m0[2].x, _468);
        _474 = _494;
    }
    float _496 = _474;
    float _498 = _480 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
    float _500 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[1].z, _490);
    float _502 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[0].z, _492);
    float _504 = _496;
    float _506 = _498;
    if (_376)
    {
        float _508 = fma(_488, (*spvDescriptorSet0.vp_c4)._m0[2].z, _496);
        _504 = _508;
    }
    float _510 = _504;
    float _512 = _500 + (*spvDescriptorSet0.vp_c4)._m0[1].w;
    float _514 = _502 + (*spvDescriptorSet0.vp_c4)._m0[0].w;
    if (_376)
    {
        float _516 = _510 + (*spvDescriptorSet0.vp_c4)._m0[2].w;
        _506 = _516;
    }
    float _518 = _506;
    float _520 = precise::max(_332, 0.100000001490116119384765625);
    float _522 = _512 * (*spvDescriptorSet0.vp_c4)._m0[8].y;
    float _524 = _512 * (*spvDescriptorSet0.vp_c4)._m0[7].y;
    float _526 = _512 * (*spvDescriptorSet0.vp_c4)._m0[9].y;
    float _528 = _512 * (*spvDescriptorSet0.vp_c4)._m0[10].y;
    float _530 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[8].x, _522);
    float _532 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[7].x, _524);
    float _534 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[9].x, _526);
    float _536 = fma(_514, (*spvDescriptorSet0.vp_c4)._m0[10].x, _528);
    float _538 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[8].z, _530);
    float _540 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[7].z, _532);
    float _542 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[9].z, _534);
    float _544 = fma(_518, (*spvDescriptorSet0.vp_c4)._m0[10].z, _536);
    float _546 = _538 + (*spvDescriptorSet0.vp_c4)._m0[8].w;
    float _548 = _540 + (*spvDescriptorSet0.vp_c4)._m0[7].w;
    float _550 = _542 + (*spvDescriptorSet0.vp_c4)._m0[9].w;
    float _552 = _544 + (*spvDescriptorSet0.vp_c4)._m0[10].w;
    out.m_46.x = _320;
    out.m_46.y = _210;
    out.m_46.z = _520;
    out.m_46.w = _182;
    out.gl_Position.x = _548;
    out.gl_Position.y = _546;
    out.gl_Position.z = _550;
    out.gl_Position.w = _552;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_46.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_46.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_46.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_46.w)); dm_cw(dm_gs, dm_p, 20, 0u); dm_cw(dm_gs, dm_p, 21, 0u); dm_cw(dm_gs, dm_p, 22, 0u); dm_cw(dm_gs, dm_p, 23, 0x3f800000u); dm_cw(dm_gs, dm_p, 24, 0u); dm_cw(dm_gs, dm_p, 25, 0u); dm_cw(dm_gs, dm_p, 26, 0u); dm_cw(dm_gs, dm_p, 27, 0x3f800000u); dm_cw(dm_gs, dm_p, 28, 0u); dm_cw(dm_gs, dm_p, 29, 0u); dm_cw(dm_gs, dm_p, 30, 0u); dm_cw(dm_gs, dm_p, 31, 0x3f800000u); dm_cw(dm_gs, dm_p, 32, 0u); dm_cw(dm_gs, dm_p, 33, 0u); dm_cw(dm_gs, dm_p, 34, 0u); dm_cw(dm_gs, dm_p, 35, 0x3f800000u); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, 0u); dm_cw(dm_gs, dm_p, 41, 0u); dm_cw(dm_gs, dm_p, 42, 0u); dm_cw(dm_gs, dm_p, 43, 0x3f800000u); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

