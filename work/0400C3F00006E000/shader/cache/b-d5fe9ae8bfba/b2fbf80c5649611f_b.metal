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

struct _10
{
    uint _m0;
    uint4 _m1[8];
    float4 _m2;
    float4 _m3;
    int _m4;
    float4 _m5[73];
    int4 _m6;
    int _m7;
};

struct _16
{
    float4 _m0[4096];
};

struct spvDescriptorSetBuffer0
{
    constant _10* support_buffer [[id(0)]];
    constant _16* vp_c8 [[id(1)]];
    constant _16* vp_c10 [[id(2)]];
    constant _16* vp_c9 [[id(3)]];
    constant _16* vp_c15 [[id(4)]];
    constant _16* vp_c7 [[id(5)]];
    texture2d<float> vp_t_tcb_C [[id(6)]];
    sampler vp_t_tcb_CSmplr [[id(7)]];
    texture3d<float> vp_t_tcb_32 [[id(8)]];
    sampler vp_t_tcb_32Smplr [[id(9)]];
    texture3d<float> vp_t_tcb_30 [[id(10)]];
    sampler vp_t_tcb_30Smplr [[id(11)]];
    texture2d<float> vp_t_tcb_1C [[id(12)]];
    sampler vp_t_tcb_1CSmplr [[id(13)]];
    sampler vp_t_tcb_32Smplr_w [[id(14)]];
    sampler vp_t_tcb_30Smplr_w [[id(15)]];
    sampler vp_t_tcb_1CSmplr_w [[id(16)]];
    constant dm_border_t* dm_border [[id(17)]];
};

struct main0_out
{
    float4 m_61 [[user(locn0)]];
    float4 m_59 [[user(locn1)]];
    float4 m_63 [[user(locn2)]];
    float4 m_47 [[user(locn3)]];
    float4 m_55 [[user(locn4)]];
    float4 m_65 [[user(locn6)]];
    float4 gl_Position [[position, invariant]];
    float gl_PointSize [[point_size]];
};

struct main0_in
{
    float4 m_44 [[attribute(2)]];
    float4 m_49 [[attribute(3)]];
    float4 m_57 [[attribute(5)]];
    float4 m_53 [[attribute(6)]];
    float4 m_51 [[attribute(7)]];
};

static inline __attribute__((always_inline))
int _80(thread const int& _4851, thread const int& _4852, constant _10& support_buffer)
{
    float _4855 = as_type<float>(support_buffer._m4);
    int _4857 = _4852 + as_type<int>(_4855);
    int _4859 = 1 + _4857;
    float _4861 = support_buffer._m5[_4859].x;
    float _4863 = abs(_4861);
    bool _4865 = _4863 == 1.0;
    if (_4865)
    {
        return _4851;
    }
    float _4867 = float(_4851);
    float _4869 = _4867 / _4863;
    int _4871 = int(_4869);
    return _4871;
}

static inline __attribute__((always_inline))
int _81(thread const int& _4901, thread const int& _4902, constant _10& support_buffer)
{
    float _4905 = as_type<float>(support_buffer._m4);
    int _4907 = _4902 + as_type<int>(_4905);
    int _4909 = 1 + _4907;
    float _4911 = support_buffer._m5[_4909].x;
    bool _4913 = _4911 == 1.0;
    if (_4913)
    {
        return _4901;
    }
    float _4915 = float(_4901);
    float _4917 = _4915 * _4911;
    int _4919 = int(_4917);
    return _4919;
}

static inline __attribute__((always_inline))
void _78(thread const int& _4526, thread const int& _4527, thread const int& _4528, thread const int& _4529, thread int& _4530, thread int& _4531, thread int& _4532, thread int& _4533, thread int& _4534, thread int& _4535, thread float4& gl_Position, thread float& gl_PointSize)
{
    gl_PointSize = 1.0;
    int _4538 = _4526;
    int _4540 = _4528;
    float _4542 = as_type<float>(_4527) + 0.0;
    bool _4544 = _4542 != 0.0;
    bool _4546 = isnan(_4542);
    bool _4548 = _4544 || _4546;
    bool _4550 = isnan(0.0);
    bool _4552 = _4548 || _4550;
    int _4554 = as_type<int>(_4542);
    int _4556 = _4552 ? (-1) : 0;
    if (!_4552)
    {
        float _4558 = as_type<float>(_4527) * 1.0;
        _4554 = as_type<int>(_4558);
    }
    int _4560 = _4554;
    bool _4562 = !_4552;
    int _4564 = _4560;
    if (!_4562)
    {
        float _4566 = as_type<float>(_4527) + 0.0;
        bool _4568 = _4566 >= 0.0;
        bool _4570 = isnan(_4566);
        bool _4572 = _4568 || _4570;
        bool _4574 = isnan(0.0);
        bool _4576 = _4572 || _4574;
        int _4578 = as_type<int>(_4566);
        _4556 = _4576 ? (-1) : 0;
        if (!_4576)
        {
            _4578 = 2147483647;
        }
        int _4580 = _4578;
        bool _4582 = !_4576;
        _4564 = _4580;
        if (!_4582)
        {
            float _4584 = abs(as_type<float>(_4527));
            float _4586 = _4584 + 0.0;
            bool _4588 = _4586 > as_type<float>(0x7f800000u /* inf */);
            bool _4590 = isnan(_4586);
            bool _4592 = _4588 || _4590;
            bool _4594 = isnan(as_type<float>(0x7f800000u /* inf */));
            bool _4596 = _4592 || _4594;
            int _4598 = as_type<int>(_4586);
            _4556 = _4596 ? (-1) : 0;
            if (_4596)
            {
                float _4600 = as_type<float>(_4527) + 1.0;
                _4598 = as_type<int>(_4600);
            }
            int _4602 = _4598;
            _4564 = _4602;
            if (!_4596)
            {
                float _4604 = abs(as_type<float>(_4527));
                float _4606 = _4604 + (-0.0);
                float _4608 = 0.0 + _4606;
                bool _4610 = _4608 != as_type<float>(0x7f800000u /* inf */);
                bool _4612 = isnan(_4608);
                bool _4614 = _4610 || _4612;
                bool _4616 = isnan(as_type<float>(0x7f800000u /* inf */));
                bool _4618 = _4614 || _4616;
                int _4620 = as_type<int>(_4608);
                _4556 = _4618 ? (-1) : 0;
                if (!_4618)
                {
                    _4620 = _4527;
                }
                int _4622 = _4620;
                bool _4624 = !_4618;
                _4564 = _4622;
                if (!_4624)
                {
                    float _4626 = as_type<float>(_4527) * 18446744073709551616.0;
                    float _4628 = rsqrt(_4626);
                    float _4630 = _4626 * _4628;
                    float _4632 = _4628 * 0.5;
                    float _4634 = -_4630;
                    float _4636 = 0.0 + _4634;
                    float _4638 = fma(_4632, _4636, 0.5);
                    float _4640 = fma(_4630, _4638, _4630);
                    float _4642 = -_4640;
                    float _4644 = 0.0 + _4642;
                    float _4646 = fma(_4640, _4644, _4626);
                    float _4648 = fma(_4632, _4646, _4640);
                    float _4650 = _4648 * 2.3283064365386962890625e-10;
                    _4564 = as_type<int>(_4650);
                    _4538 = as_type<int>(_4636);
                    _4540 = as_type<int>(_4640);
                }
            }
        }
    }
    int _4652 = _4564;
    int _4654 = _4538;
    int _4656 = _4540;
    int _4658 = _4556;
    _4530 = _4652;
    _4531 = _4654;
    _4532 = _4529;
    _4533 = 0;
    _4534 = _4656;
    _4535 = _4658;
}

vertex main0_out main0(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _89 = int(_87);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1846 = as_type<float>(_105);
        out.gl_Position.z = _1846;
    }
    if (!_93)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1914 = as_type<float>(_141);
        out.gl_Position.z = _1914;
    }
    if (_135)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    float _143 = in.m_51.x;
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_51.y;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_53.w;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _145;
    if (!_157)
    {
        float _177 = _145 * _145;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_157)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    out.m_55.x = _143;
    out.m_55.y = _147;
    bool _189 = !_157;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _145 * _195;
        float _205 = exp2(_203);
        float _207 = _201 * 0.693147182464599609375;
        float _209 = 1.0 / _207;
        float _211 = 1.0 / _199;
        float _213 = _205 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _209, _145);
        float _219 = _217 * _211;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_157;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _145 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _175 = _245;
    }
    float _247 = _175;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _161, _251);
    float _259 = fma(_247, _163, _253);
    float _261 = fma(_247, _165, _255);
    float _263 = fma(_257, _159, _167);
    float _265 = fma(_259, _159, _169);
    float _267 = fma(_261, _159, _171);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_57.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_89);
        float _293 = 1.0 / _291;
        float _295 = _123 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    int _299 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _301 = _299;
    int _303 = 0;
    int _305 = _80(_301, _303, (*spvDescriptorSet0.support_buffer));
    float _307 = in.m_57.x;
    float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _311 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _315 = floor(_313);
    float _317 = fma(_315, _309, _307);
    float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _321 = float(_305);
    int _323 = abs(_305);
    float _325 = _319 * _321;
    float _327 = float(uint(_323));
    int _329 = ~_323;
    int _331 = _329 + 1;
    float _333 = trunc(_325);
    int _335 = int(_333);
    float _337 = 1.0 / _327;
    int _339 = abs(_335);
    uint _342 = uint(int(uint(_335) >> uint(31)));
    float _344 = float(uint(_339));
    int _346 = ~int(_342);
    int _348 = _346 + 1;
    int _350 = as_type<int>(_337) + (-2);
    int _352 = ~_323;
    int _354 = _352 + 1;
    float _356 = as_type<float>(_350) * _344;
    float _358 = trunc(_356);
    float _360 = precise::max(_358, 0.0);
    uint _362 = uint(_360);
    int _364 = _331 * int(_362);
    int _366 = _364 + _339;
    float _368 = float(uint(_366));
    float _370 = as_type<float>(_350) * _368;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = ~_323;
    int _380 = _378 + 1;
    int _382 = int(_362) + int(_376);
    int _384 = _354 * _382;
    int _386 = _384 + _339;
    bool _388 = uint(_386) >= uint(_323);
    bool _390 = !_388;
    int _392 = _390 ? 0 : (-1);
    bool _394 = _305 == 0;
    int _396 = ~_382;
    int _398 = _396 + _392;
    int _400 = _398 + 1;
    int _402 = ~_323;
    int _404 = _402 + 1;
    int _406 = _323 * _400;
    int _408 = _406 + _339;
    int _410 = _408 ^ _348;
    int _412 = ~_348;
    int _414 = _412 + _410;
    int _416 = _414 + 1;
    bool _418 = !_394;
    int _420 = _418 ? _416 : (-1);
    int _422 = _420 + 1;
    int _424 = abs(_422);
    uint _426 = uint(int(uint(_422) >> uint(31)));
    float _428 = float(uint(_424));
    int _430 = ~int(_426);
    int _432 = _430 + 1;
    float _434 = as_type<float>(_350) * _428;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = _404 * int(_440);
    int _444 = _442 + _424;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_350) * _446;
    float _450 = in.m_51.z;
    float _452 = trunc(_448);
    float _454 = precise::max(_452, 0.0);
    uint _456 = uint(_454);
    int _458 = int(_440) + int(_456);
    int _460 = _380 * _458;
    int _462 = _460 + _424;
    float _464 = trunc(_450);
    int _466 = int(_464);
    bool _468 = uint(_462) >= uint(_323);
    bool _470 = !_468;
    int _472 = _470 ? 0 : (-1);
    int _474 = ~_458;
    int _476 = _474 + _472;
    int _478 = _476 + 1;
    int _480 = _323 * _478;
    int _482 = _480 + _424;
    int _484 = _482 ^ _432;
    int _486 = ~_432;
    int _488 = _486 + _484;
    int _490 = _488 + 1;
    bool _492 = !_394;
    int _494 = _492 ? _490 : (-1);
    int _496 = _420;
    int _498 = 0;
    int _500 = _81(_496, _498, (*spvDescriptorSet0.support_buffer));
    int _502 = _466;
    int _504 = 0;
    int _506 = _81(_502, _504, (*spvDescriptorSet0.support_buffer));
    float3 _510 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_500, _506)), 0).xyz;
    float _512 = _510.x;
    float _514 = _510.y;
    float _516 = _510.z;
    int _518 = _494;
    int _520 = 0;
    int _522 = _81(_518, _520, (*spvDescriptorSet0.support_buffer));
    int _524 = _466;
    int _526 = 0;
    int _528 = _81(_524, _526, (*spvDescriptorSet0.support_buffer));
    float3 _530 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_522, _528)), 0).xyz;
    float _532 = _530.x;
    float _534 = _530.y;
    float _536 = _530.z;
    float _538 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _540 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _542 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
    float _544 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
    float _548 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _542);
    float _550 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _552 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _546);
    float _554 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
    float _558 = _552 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _560;
    float _564 = -_554;
    float _566 = _564 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _568 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = -_558;
    float _572 = _570 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _576 = _554 + _574;
    float _578 = _566 * _566;
    float _580 = -_568;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _558 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _588;
    float _592 = fma(_572, _572, _578);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _602 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _604 = isnan(_297);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_582, _582, _592);
    float _616 = rsqrt(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _626 = 1.0 / _620;
    float _628 = _582 * _616;
    float _630 = _572 * _616;
    float _632 = _566 * _616;
    float _634 = 1.0 / _624;
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _297 + _638;
    float _642 = _632 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _644 = -_636;
    float _646 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].y, _644);
    float _648 = _630 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _650 = -_642;
    float _652 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[9].y, _650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _656 = _297 + _654;
    float _658 = _646 * _646;
    float _660 = -_648;
    float _662 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].y, _660);
    float _664 = _576 * _576;
    float _666 = fma(_652, _652, _658);
    float _668 = _640 * _626;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _672 = _568 + _670;
    float _674 = fma(_586, _586, _664);
    float _676 = fma(_662, _662, _666);
    float _678 = _656 * _634;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _680;
    float _684 = fma(_672, _672, _674);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _690 = fma(_562, _668, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _692 = rsqrt(_676);
    float _694 = fma(_682, _668, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _696 = fma(_590, _668, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _698 = fma(_688, _678, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _700 = fma(_596, _678, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _702 = fma(_600, _678, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _704 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _706 = isnan(_297);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = rsqrt(_684);
    float _718 = -_714;
    float _720 = _718 + 1.0;
    float _722 = _652 * _692;
    float _724 = _646 * _692;
    float _726 = _662 * _692;
    float _728 = _722 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _730 = _724 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _732 = _726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _734 = -_728;
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].y, _734);
    bool _738 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _740 = isnan(_297);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_732;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].y, _750);
    float _754 = _576 * _716;
    float _756 = _586 * _716;
    float _758 = _736 * _736;
    float _760 = -_730;
    float _762 = fma(_722, (*spvDescriptorSet0.vp_c10)._m0[9].y, _760);
    float _764 = -_754;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _576);
    float _768 = -_756;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _772 = fma(_752, _752, _758);
    float _774 = in.m_53.x;
    float _776 = in.m_53.y;
    float _778 = in.m_53.z;
    float _780 = _766 * _766;
    float _782 = _748 * _720;
    float _784 = -_748;
    float _786 = _784 + 1.0;
    float _788 = _672 * _716;
    float _790 = fma(_770, _770, _780);
    float _792 = fma(_762, _762, _772);
    float _794 = _612 * _786;
    float _796 = -_788;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _672);
    float _800 = -_612;
    float _802 = _800 + 1.0;
    float _804 = _690 * _794;
    float _806 = fma(_798, _798, _790);
    float _808 = rsqrt(_792);
    float _810 = _694 * _794;
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].y, _804);
    float _814 = _696 * _794;
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].x, _810);
    float _818 = fma(_700, _782, _812);
    float _820 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].z, _814);
    float _822 = sqrt(_806);
    float _824 = fma(_698, _782, _816);
    float _826 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].y, _818);
    float _828 = fma(_702, _782, _820);
    float _830 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].x, _824);
    float _832 = _826 * _776;
    float _834 = floor(_325);
    float _836 = _736 * _808;
    float _838 = _752 * _808;
    float _840 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _762 * _808;
    float _844 = _836 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _846 = _830 * _774;
    float _848 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].z, _828);
    float _850 = _716 * _822;
    float _852 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = _848 * _778;
    float _858 = _840 * _850;
    float _860 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].z, _852);
    float _862 = _854 * _850;
    float _864 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = -_834;
    float _868 = _325 + _866;
    float _870 = abs(_860);
    float _872 = -_870;
    float _874 = _872 + 1.0;
    float _876 = _864 * _850;
    float _878 = -_514;
    float _880 = _878 + _534;
    float _882 = -_512;
    float _884 = _882 + _532;
    float _886 = -_516;
    float _888 = _886 + _536;
    int _890 = as_type<int>(_874) + (-218103808);
    float _892 = fma(_868, _880, _514);
    float _894 = fma(_868, _884, _512);
    float _896 = fma(_868, _888, _516);
    bool _898 = uint(_890) >= 1920991232u;
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _892);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _894);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    out.m_59.y = _892;
    float _906 = _858 * _900;
    float _908 = _862 * _902;
    float _910 = _876 * _904;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _912);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _914);
    float _922 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    float _926 = abs(_860);
    float _928 = fma(_926, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _940 = abs(_860);
    float _942 = fma(_940, _928, -0.212114393711090087890625);
    float _944 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = abs(_860);
    float _952 = fma(_950, _942, 1.570728778839111328125);
    bool _954 = _860 < 0.0;
    float _956 = float(_954);
    bool _958 = !_898;
    float _960 = _930;
    float _982;
    if (!_958)
    {
        int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[107].y);
        int _964 = as_type<int>(_874);
        int _966 = as_type<int>(_858);
        int _968 = 4960;
        int _970;
        int _972;
        int _974;
        int _976;
        int _978;
        int _980;
        _78(_962, _964, _966, _968, _970, _972, _974, _976, _978, _980, out.gl_Position, out.gl_PointSize);
        _982 = as_type<float>(_970);
        _984 = true;
    }
    else
    {
        float _986 = rsqrt(_874);
        float _988 = _874 * _986;
        float _990 = _986 * 0.5;
        float _992 = -_988;
        float _994 = 0.0 + _992;
        float _996 = fma(_990, _994, 0.5);
        float _998 = fma(_988, _996, _988);
        float _1000 = -_998;
        float _1002 = 0.0 + _1000;
        float _1004 = fma(_998, _1002, _874);
        float _1006 = fma(_990, _1004, _998);
        _982 = _1006;
    }
    _984 = false;
    float _1008 = _982;
    float _1010 = _842 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1012 = _836 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1014 = _952 * _1008;
    float _1016 = -_1010;
    float _1018 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1016);
    float _1020 = -_1012;
    float _1022 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1020);
    float _1024 = _838 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1026 = _1018 * _1018;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1030 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1028;
    float _1032 = -_1024;
    float _1034 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1032);
    float _1036 = fma(_1022, _1022, _1026);
    float _1038 = -_1030;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1042;
    float _1046 = fma(_1034, _1034, _1036);
    float _1048 = _956 * 2.0;
    float _1050 = rsqrt(_1046);
    float _1052 = -_1048;
    float _1054 = fma(_1014, _1052, _1014);
    float _1056 = fma(_956, 3.1415927410125732421875, _1054);
    float _1058 = _1056 * 0.15915493667125701904296875;
    float _1060 = _1058 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = _1018 * _1050;
    float _1066 = _1022 * _1050;
    float _1068 = _1034 * _1050;
    float _1070 = _1064 * _1064;
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = fma(_1068, _1068, _1072);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1078 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1076;
    float _1080 = rsqrt(_1074);
    float _1082 = -_1078;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1086 = _1084 * _1084;
    float _1088 = _1058 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(_1040, _1040, _1086);
    float _1094 = -_1044;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1098 = fma(_1096, _1096, _1092);
    float _1100 = _1066 * _1080;
    float _1102 = _1064 * _1080;
    float _1104 = _1068 * _1080;
    float _1106 = -_1062;
    float _1108 = _1106 + 1.0;
    float _1110 = sqrt(_1098);
    float _1112 = _1104 * _1104;
    float _1114 = _1102 * _1108;
    float _1116 = _1100 * _1090;
    float _1118 = _1104 * _1090;
    float _1120 = _1100 * _1108;
    float _1122 = _1102 * _1090;
    float _1124 = fma(_1104, _1114, _1116);
    float _1126 = fma(_1108, _1112, _1062);
    float _1128 = -_1118;
    float _1130 = fma(_1102, _1120, _1128);
    float _1132 = -_1122;
    float _1134 = fma(_1104, _1120, _1132);
    float _1136 = _924 * _1124;
    float _1138 = fma(_1100, _1120, _1062);
    float _1140 = _924 * _1130;
    float _1142 = fma(_930, _1134, _1136);
    float _1144 = fma(_1110, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1146 = fma(_930, _1138, _1140);
    float _1148 = fma(_1104, _1120, _1122);
    float _1150 = fma(_932, _1126, _1142);
    float _1152 = fma(_1102, _1120, _1118);
    float _1154 = precise::max(_1144, 0.3499999940395355224609375);
    float _1156 = fma(_932, _1148, _1146);
    float _1158 = _568 + _1150;
    float _1160 = -_1116;
    float _1162 = fma(_1104, _1114, _1160);
    float _1164 = precise::min(_1154, 1.0);
    float _1166 = _558 + _1156;
    float _1168 = -_1044;
    float _1170 = _1158 + _1168;
    float _1172 = -_1030;
    float _1174 = _1166 + _1172;
    float _1176 = fma(_1170, _1164, _1044);
    float _1178 = fma(_1174, _1164, _1030);
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1182 = _1176 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1186 = _1178 + _1184;
    float _1188 = _1182 * _1182;
    float _1190 = fma(_1186, _1186, _1188);
    float _1192 = fma(_1102, _1114, _1062);
    float _1194 = sqrt(_1190);
    float _1196 = _924 * _1192;
    float _1198 = fma(_930, _1152, _1196);
    float _1200 = fma(_932, _1162, _1198);
    float _1202 = _554 + _1200;
    bool _1204 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = -_1078;
    float _1208 = _1202 + _1206;
    float _1210 = fma(_1208, _1164, _1078);
    float _1212 = _1078;
    float _1214 = _1062;
    float _1216 = _1186;
    float _1218 = _1182;
    if (!_1204)
    {
        _1212 = _1178;
    }
    float _1220 = _1212;
    float _1222 = _1220;
    if (!_1204)
    {
        _960 = _1176;
    }
    float _1224 = _960;
    float _1226 = _1224;
    if (!_1204)
    {
        _1214 = _1210;
    }
    float _1228 = _1214;
    bool _1230 = !_1204;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1194 + _1236;
        float _1240 = rsqrt(_1190);
        float _1242 = _1238 * _1234;
        float _1244 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = _1242 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = sin(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = fma(_1250, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1258 = _1240 * _1256;
        float _1260 = _1254 + (-1.0);
        float _1262 = fma(_1186, _1258, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1264 = fma(_1182, _1258, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = fma(_1210, _1254, _1266);
        _1232 = _1268;
        _1222 = _1262;
        _1226 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = -_754;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1270);
    float _1280 = -_756;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1284 = -_788;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1290 = _1278 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1282 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1298 = _1286 + _1296;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1294, _1294, _1300);
    float _1304 = fma(_1298, _1298, _1302);
    float _1306 = rsqrt(_1304);
    float _1308 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1310 = _1294 * _1308;
    float _1312 = _1298 * _1308;
    float _1314 = _1310 * _1310;
    float _1316 = _1312 * _1312;
    float _1318 = _1314 + _1316;
    float _1320 = sqrt(_1318);
    bool _1322 = _1320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1320 + _1324;
    float _1328 = _1306;
    float _1330 = _1318;
    float _1332 = _1326;
    float _1334 = _1290;
    float _1336 = _1310;
    if (_1322)
    {
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1338;
    }
    float _1340 = _1328;
    if (_1322)
    {
        float _1342 = rsqrt(_1318);
        _1330 = _1342;
    }
    float _1344 = _1330;
    if (_1322)
    {
        float _1346 = _1326 * _1340;
        _1332 = _1346;
    }
    float _1348 = _1332;
    if (_1322)
    {
        float _1350 = _1348 * 0.15915493667125701904296875;
        _1216 = _1350;
    }
    float _1352 = _1216;
    float _1354 = _1298;
    if (_1322)
    {
        float _1356 = _1352 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1364 = precise::max(0.0, _1362);
    float _1366 = _1152;
    float _1368 = _1364;
    float _1370 = _1362;
    if (_1322)
    {
        float _1372 = _1352 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        _1366 = _1374;
    }
    float _1376 = _1366;
    float _1378 = -_1308;
    float _1380 = -_1364;
    float _1382 = fma(_1290, _1378, _1380);
    if (_1322)
    {
        float _1384 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1384;
    }
    float _1386 = _1368;
    float _1388 = _1386;
    float _1390 = _1360;
    if (_1322)
    {
        float _1392 = fma(_1360, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = _1394;
    if (!_1322)
    {
        _1390 = _1312;
    }
    float _1398 = _1390;
    float _1400 = _1398;
    if (_1322)
    {
        float _1402 = _1376 + (-1.0);
        _1370 = _1402;
    }
    float _1404 = _1370;
    float _1406 = _1404;
    if (_1322)
    {
        float _1408 = _1344 * _1394;
        _1218 = _1408;
    }
    float _1410 = _1218;
    if (!_1322)
    {
        _1396 = _1382;
    }
    float _1412 = _1396;
    float _1414 = sqrt(_1304);
    float _1416 = _1412;
    if (_1322)
    {
        float _1418 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1418;
    }
    float _1420 = _1334;
    float _1422 = _1420;
    if (_1322)
    {
        float _1424 = _1310 * _1410;
        _1336 = _1424;
    }
    float _1426 = _1336;
    if (!_1322)
    {
        _1406 = _1314;
    }
    float _1428 = _1406;
    float _1430 = _1428;
    if (_1322)
    {
        float _1432 = _1312 * _1410;
        _1400 = _1432;
    }
    float _1434 = _1400;
    if (_1322)
    {
        float _1436 = fma(_1382, _1376, _1420);
        _1416 = _1436;
    }
    float _1438 = _1416;
    if (_1322)
    {
        float _1440 = _1426 * _1426;
        _1430 = _1440;
    }
    float _1442 = _1430;
    if (!_1322)
    {
        _1422 = _1316;
    }
    float _1444 = _1422;
    float _1446 = _1444;
    if (_1322)
    {
        float _1448 = _1434 * _1434;
        _1446 = _1448;
    }
    float _1450 = _1446;
    float _1452 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1454 = fma(_1438, _1438, _1442);
    float _1456 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1458 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1452);
    float _1460 = _1454 + _1450;
    float _1462 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1456);
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1466 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1464);
    float _1468 = precise::clamp(_1466, 0.0, 1.0);
    float _1470 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1472 = rsqrt(_1460);
    float _1474 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1476 = -_1468;
    float _1478 = _1476 + 1.0;
    float _1480 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1482 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1470);
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1488 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1480);
    float _1490 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1482);
    float _1492 = abs(_1478);
    float _1494 = log2(_1492);
    float _1496 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1498 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1488);
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1502 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1506 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1508 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1510 = _1472 * _1426;
    float _1512 = _1472 * _1434;
    float _1514 = -_1502;
    float _1516 = fma(_1514, _1486, 1.0);
    float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1508);
    float _1520 = _1472 * _1438;
    float _1522 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1524 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1526 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1518);
    float _1528 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1530 = -_1522;
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1530);
    float _1534 = log2(_1516);
    float _1536 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1526);
    float _1538 = -_1512;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1532);
    float _1542 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1544 = fma(_1540, -0.5, 0.5);
    float _1546 = exp2(_1528);
    float _1548 = fma(_1540, 0.5, 0.5);
    float _1550 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1542);
    float _1552 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1524);
    float _1554 = _1520 + 1.0;
    float _1556 = fma(_1548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1558 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1550);
    float _1560 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1552);
    float _1562 = 1.0 / _1536;
    float _1564 = fma(_1548, _1556, -0.212114393711090087890625);
    float _1566 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1558);
    float _1568 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1560);
    float _1570 = _1534 * 0.693147182464599609375;
    float _1572 = fma(_1548, _1564, 1.570728778839111328125);
    float _1574 = sqrt(_1544);
    float _1576 = -_1520;
    float _1578 = fma(_1546, _1554, _1576);
    float _1580 = fma(_1578, 0.5, 0.5);
    float _1582 = _1566 * _1562;
    float _1584 = _1568 * _1562;
    float _1586 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1588 = fma(_1582, 0.5, 0.5);
    float _1590 = fma(_1584, -0.5, 0.5);
    float _1592 = _1574 * 0.636619746685028076171875;
    float _1594 = -_1572;
    float _1596 = fma(_1592, _1594, 1.0);
    float3 _4185 = float3(_1588, _1590, _1586);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4185, float3(0.0), isnan(_4185)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4185, float3(0.0), isnan(_4185)), level(0.0)).x;
    float3 _4196 = float3(_1588, _1590, _1586);
    float4 _1601 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4196, float3(0.0), isnan(_4196)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4196, float3(0.0), isnan(_4196)), level(0.0)).xyzw;
    float _1603 = _1601.x;
    float _1605 = _1601.y;
    float _1607 = _1601.z;
    float _1609 = _1601.w;
    float2 _4213 = float2(_1596, _1580);
    float3 _1611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4213, float2(0.0), isnan(_4213)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4213, float2(0.0), isnan(_4213)), level(0.0)).xyz;
    float _1613 = _1611.x;
    float _1615 = _1611.y;
    float _1617 = _1611.z;
    float _1619 = -_754;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _1623 = -_756;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _1627 = -_788;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _1631 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1633 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1631);
    float _1635 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1637 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1633);
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1635);
    bool _1641 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.5);
    bool _1649 = _1645 || _1647;
    float _1651 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1653 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1639);
    float _1655 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1659 = 1.0 / _1651;
    float _1661 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1663 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1665 = _1661 + _1651;
    float _1667 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1663);
    float _1669 = exp2(_1655);
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1649)
    {
        _1671 = 1.0;
    }
    float _1673 = _1671;
    float _1675 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1667);
    float _1677 = _1665 * _1659;
    float _1679 = _1677 * 0.5;
    float _1681 = _1673;
    if (!_1649)
    {
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1687 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1685);
        float _1689 = _1683 * 0.15915493667125701904296875;
        float _1691 = _1689 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = _1689 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = 1.0 / _1693;
        float _1705 = _1697 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        float _1709 = _1701 * _1703;
        float _1711 = 1.0 / _1687;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1713;
        float _1717 = _1707 * _1709;
        float _1719 = _1697 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = 1.0 / _1717;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1727 = _1711 * _1725;
        float _1729 = 1.0 / _1715;
        float _1731 = _1721 * _1723;
        float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1735 = fma(_1731, _1727, _1733);
        float _1737 = _1735 * _1729;
        float _1739 = precise::clamp(_1737, 0.0, 1.0);
        float _1741 = -_1739;
        float _1743 = _1741 + 1.0;
        _1681 = _1743;
    }
    float _1745 = _1681;
    float _1747 = -_1669;
    float _1749 = _1747 + 1.0;
    bool _1751 = _1745 > 0.0;
    bool _1753 = isnan(_1745);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = _1745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1763 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1765 = _1675 + _1536;
    out.m_61.x = _944;
    out.m_61.y = _946;
    out.m_61.z = _948;
    float _1767 = _1763 * _1598;
    float _1769 = -_1763;
    float _1771 = _1769 + 1.0;
    out.gl_Position.x = _1566;
    out.gl_Position.y = _1568;
    out.gl_Position.z = _1675;
    out.gl_Position.w = _1536;
    float _1773 = _1765 * 0.5;
    float _1775 = _1609 * _1767;
    float _1777 = _1617 * _1767;
    float _1779 = _1761 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1781 = _1609 * _1771;
    out.m_63.z = _1773;
    out.m_63.w = _1536;
    float _1783 = fma(_1613, _1775, _1603);
    float _1785 = fma(_1615, _1775, _1605);
    float _1787 = fma(_1609, _1777, _1607);
    out.m_47.x = _1779;
    out.m_65.x = _1783;
    out.m_65.y = _1785;
    out.m_65.z = _1787;
    out.m_65.w = _1781;
    if (_1759)
    {
        out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
    }
    out.m_47.x = 0.0;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1789;
    out.gl_Position.z = fma(out.gl_Position.z, 0.5, out.gl_Position.w * 0.5);
    return out;
}


vertex main0_out main0_z(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]])
{
    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _89 = int(_87);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1846 = as_type<float>(_105);
        out.gl_Position.z = _1846;
    }
    if (!_93)
    {
        return out;
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1914 = as_type<float>(_141);
        out.gl_Position.z = _1914;
    }
    if (_135)
    {
        return out;
    }
    float _143 = in.m_51.x;
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_51.y;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_53.w;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _145;
    if (!_157)
    {
        float _177 = _145 * _145;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_157)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    out.m_55.x = _143;
    out.m_55.y = _147;
    bool _189 = !_157;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _145 * _195;
        float _205 = exp2(_203);
        float _207 = _201 * 0.693147182464599609375;
        float _209 = 1.0 / _207;
        float _211 = 1.0 / _199;
        float _213 = _205 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _209, _145);
        float _219 = _217 * _211;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_157;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _145 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _175 = _245;
    }
    float _247 = _175;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _161, _251);
    float _259 = fma(_247, _163, _253);
    float _261 = fma(_247, _165, _255);
    float _263 = fma(_257, _159, _167);
    float _265 = fma(_259, _159, _169);
    float _267 = fma(_261, _159, _171);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_57.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_89);
        float _293 = 1.0 / _291;
        float _295 = _123 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    int _299 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _301 = _299;
    int _303 = 0;
    int _305 = _80(_301, _303, (*spvDescriptorSet0.support_buffer));
    float _307 = in.m_57.x;
    float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _311 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _315 = floor(_313);
    float _317 = fma(_315, _309, _307);
    float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _321 = float(_305);
    int _323 = abs(_305);
    float _325 = _319 * _321;
    float _327 = float(uint(_323));
    int _329 = ~_323;
    int _331 = _329 + 1;
    float _333 = trunc(_325);
    int _335 = int(_333);
    float _337 = 1.0 / _327;
    int _339 = abs(_335);
    uint _342 = uint(int(uint(_335) >> uint(31)));
    float _344 = float(uint(_339));
    int _346 = ~int(_342);
    int _348 = _346 + 1;
    int _350 = as_type<int>(_337) + (-2);
    int _352 = ~_323;
    int _354 = _352 + 1;
    float _356 = as_type<float>(_350) * _344;
    float _358 = trunc(_356);
    float _360 = precise::max(_358, 0.0);
    uint _362 = uint(_360);
    int _364 = _331 * int(_362);
    int _366 = _364 + _339;
    float _368 = float(uint(_366));
    float _370 = as_type<float>(_350) * _368;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = ~_323;
    int _380 = _378 + 1;
    int _382 = int(_362) + int(_376);
    int _384 = _354 * _382;
    int _386 = _384 + _339;
    bool _388 = uint(_386) >= uint(_323);
    bool _390 = !_388;
    int _392 = _390 ? 0 : (-1);
    bool _394 = _305 == 0;
    int _396 = ~_382;
    int _398 = _396 + _392;
    int _400 = _398 + 1;
    int _402 = ~_323;
    int _404 = _402 + 1;
    int _406 = _323 * _400;
    int _408 = _406 + _339;
    int _410 = _408 ^ _348;
    int _412 = ~_348;
    int _414 = _412 + _410;
    int _416 = _414 + 1;
    bool _418 = !_394;
    int _420 = _418 ? _416 : (-1);
    int _422 = _420 + 1;
    int _424 = abs(_422);
    uint _426 = uint(int(uint(_422) >> uint(31)));
    float _428 = float(uint(_424));
    int _430 = ~int(_426);
    int _432 = _430 + 1;
    float _434 = as_type<float>(_350) * _428;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = _404 * int(_440);
    int _444 = _442 + _424;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_350) * _446;
    float _450 = in.m_51.z;
    float _452 = trunc(_448);
    float _454 = precise::max(_452, 0.0);
    uint _456 = uint(_454);
    int _458 = int(_440) + int(_456);
    int _460 = _380 * _458;
    int _462 = _460 + _424;
    float _464 = trunc(_450);
    int _466 = int(_464);
    bool _468 = uint(_462) >= uint(_323);
    bool _470 = !_468;
    int _472 = _470 ? 0 : (-1);
    int _474 = ~_458;
    int _476 = _474 + _472;
    int _478 = _476 + 1;
    int _480 = _323 * _478;
    int _482 = _480 + _424;
    int _484 = _482 ^ _432;
    int _486 = ~_432;
    int _488 = _486 + _484;
    int _490 = _488 + 1;
    bool _492 = !_394;
    int _494 = _492 ? _490 : (-1);
    int _496 = _420;
    int _498 = 0;
    int _500 = _81(_496, _498, (*spvDescriptorSet0.support_buffer));
    int _502 = _466;
    int _504 = 0;
    int _506 = _81(_502, _504, (*spvDescriptorSet0.support_buffer));
    float3 _510 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_500, _506)), 0).xyz;
    float _512 = _510.x;
    float _514 = _510.y;
    float _516 = _510.z;
    int _518 = _494;
    int _520 = 0;
    int _522 = _81(_518, _520, (*spvDescriptorSet0.support_buffer));
    int _524 = _466;
    int _526 = 0;
    int _528 = _81(_524, _526, (*spvDescriptorSet0.support_buffer));
    float3 _530 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_522, _528)), 0).xyz;
    float _532 = _530.x;
    float _534 = _530.y;
    float _536 = _530.z;
    float _538 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _540 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _542 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
    float _544 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
    float _548 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _542);
    float _550 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _552 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _546);
    float _554 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
    float _558 = _552 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _560;
    float _564 = -_554;
    float _566 = _564 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _568 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = -_558;
    float _572 = _570 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _576 = _554 + _574;
    float _578 = _566 * _566;
    float _580 = -_568;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _558 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _588;
    float _592 = fma(_572, _572, _578);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _602 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _604 = isnan(_297);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_582, _582, _592);
    float _616 = rsqrt(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _626 = 1.0 / _620;
    float _628 = _582 * _616;
    float _630 = _572 * _616;
    float _632 = _566 * _616;
    float _634 = 1.0 / _624;
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _297 + _638;
    float _642 = _632 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _644 = -_636;
    float _646 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].y, _644);
    float _648 = _630 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _650 = -_642;
    float _652 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[9].y, _650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _656 = _297 + _654;
    float _658 = _646 * _646;
    float _660 = -_648;
    float _662 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].y, _660);
    float _664 = _576 * _576;
    float _666 = fma(_652, _652, _658);
    float _668 = _640 * _626;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _672 = _568 + _670;
    float _674 = fma(_586, _586, _664);
    float _676 = fma(_662, _662, _666);
    float _678 = _656 * _634;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _680;
    float _684 = fma(_672, _672, _674);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _690 = fma(_562, _668, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _692 = rsqrt(_676);
    float _694 = fma(_682, _668, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _696 = fma(_590, _668, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _698 = fma(_688, _678, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _700 = fma(_596, _678, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _702 = fma(_600, _678, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _704 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _706 = isnan(_297);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = rsqrt(_684);
    float _718 = -_714;
    float _720 = _718 + 1.0;
    float _722 = _652 * _692;
    float _724 = _646 * _692;
    float _726 = _662 * _692;
    float _728 = _722 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _730 = _724 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _732 = _726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _734 = -_728;
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].y, _734);
    bool _738 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _740 = isnan(_297);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_732;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].y, _750);
    float _754 = _576 * _716;
    float _756 = _586 * _716;
    float _758 = _736 * _736;
    float _760 = -_730;
    float _762 = fma(_722, (*spvDescriptorSet0.vp_c10)._m0[9].y, _760);
    float _764 = -_754;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _576);
    float _768 = -_756;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _772 = fma(_752, _752, _758);
    float _774 = in.m_53.x;
    float _776 = in.m_53.y;
    float _778 = in.m_53.z;
    float _780 = _766 * _766;
    float _782 = _748 * _720;
    float _784 = -_748;
    float _786 = _784 + 1.0;
    float _788 = _672 * _716;
    float _790 = fma(_770, _770, _780);
    float _792 = fma(_762, _762, _772);
    float _794 = _612 * _786;
    float _796 = -_788;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _672);
    float _800 = -_612;
    float _802 = _800 + 1.0;
    float _804 = _690 * _794;
    float _806 = fma(_798, _798, _790);
    float _808 = rsqrt(_792);
    float _810 = _694 * _794;
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].y, _804);
    float _814 = _696 * _794;
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].x, _810);
    float _818 = fma(_700, _782, _812);
    float _820 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].z, _814);
    float _822 = sqrt(_806);
    float _824 = fma(_698, _782, _816);
    float _826 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].y, _818);
    float _828 = fma(_702, _782, _820);
    float _830 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].x, _824);
    float _832 = _826 * _776;
    float _834 = floor(_325);
    float _836 = _736 * _808;
    float _838 = _752 * _808;
    float _840 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _762 * _808;
    float _844 = _836 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _846 = _830 * _774;
    float _848 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].z, _828);
    float _850 = _716 * _822;
    float _852 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = _848 * _778;
    float _858 = _840 * _850;
    float _860 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].z, _852);
    float _862 = _854 * _850;
    float _864 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = -_834;
    float _868 = _325 + _866;
    float _870 = abs(_860);
    float _872 = -_870;
    float _874 = _872 + 1.0;
    float _876 = _864 * _850;
    float _878 = -_514;
    float _880 = _878 + _534;
    float _882 = -_512;
    float _884 = _882 + _532;
    float _886 = -_516;
    float _888 = _886 + _536;
    int _890 = as_type<int>(_874) + (-218103808);
    float _892 = fma(_868, _880, _514);
    float _894 = fma(_868, _884, _512);
    float _896 = fma(_868, _888, _516);
    bool _898 = uint(_890) >= 1920991232u;
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _892);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _894);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    out.m_59.y = _892;
    float _906 = _858 * _900;
    float _908 = _862 * _902;
    float _910 = _876 * _904;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _912);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _914);
    float _922 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    float _926 = abs(_860);
    float _928 = fma(_926, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _940 = abs(_860);
    float _942 = fma(_940, _928, -0.212114393711090087890625);
    float _944 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = abs(_860);
    float _952 = fma(_950, _942, 1.570728778839111328125);
    bool _954 = _860 < 0.0;
    float _956 = float(_954);
    bool _958 = !_898;
    float _960 = _930;
    float _982;
    if (!_958)
    {
        int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[107].y);
        int _964 = as_type<int>(_874);
        int _966 = as_type<int>(_858);
        int _968 = 4960;
        int _970;
        int _972;
        int _974;
        int _976;
        int _978;
        int _980;
        _78(_962, _964, _966, _968, _970, _972, _974, _976, _978, _980, out.gl_Position, out.gl_PointSize);
        _982 = as_type<float>(_970);
        _984 = true;
    }
    else
    {
        float _986 = rsqrt(_874);
        float _988 = _874 * _986;
        float _990 = _986 * 0.5;
        float _992 = -_988;
        float _994 = 0.0 + _992;
        float _996 = fma(_990, _994, 0.5);
        float _998 = fma(_988, _996, _988);
        float _1000 = -_998;
        float _1002 = 0.0 + _1000;
        float _1004 = fma(_998, _1002, _874);
        float _1006 = fma(_990, _1004, _998);
        _982 = _1006;
    }
    _984 = false;
    float _1008 = _982;
    float _1010 = _842 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1012 = _836 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1014 = _952 * _1008;
    float _1016 = -_1010;
    float _1018 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1016);
    float _1020 = -_1012;
    float _1022 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1020);
    float _1024 = _838 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1026 = _1018 * _1018;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1030 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1028;
    float _1032 = -_1024;
    float _1034 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1032);
    float _1036 = fma(_1022, _1022, _1026);
    float _1038 = -_1030;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1042;
    float _1046 = fma(_1034, _1034, _1036);
    float _1048 = _956 * 2.0;
    float _1050 = rsqrt(_1046);
    float _1052 = -_1048;
    float _1054 = fma(_1014, _1052, _1014);
    float _1056 = fma(_956, 3.1415927410125732421875, _1054);
    float _1058 = _1056 * 0.15915493667125701904296875;
    float _1060 = _1058 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = _1018 * _1050;
    float _1066 = _1022 * _1050;
    float _1068 = _1034 * _1050;
    float _1070 = _1064 * _1064;
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = fma(_1068, _1068, _1072);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1078 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1076;
    float _1080 = rsqrt(_1074);
    float _1082 = -_1078;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1086 = _1084 * _1084;
    float _1088 = _1058 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(_1040, _1040, _1086);
    float _1094 = -_1044;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1098 = fma(_1096, _1096, _1092);
    float _1100 = _1066 * _1080;
    float _1102 = _1064 * _1080;
    float _1104 = _1068 * _1080;
    float _1106 = -_1062;
    float _1108 = _1106 + 1.0;
    float _1110 = sqrt(_1098);
    float _1112 = _1104 * _1104;
    float _1114 = _1102 * _1108;
    float _1116 = _1100 * _1090;
    float _1118 = _1104 * _1090;
    float _1120 = _1100 * _1108;
    float _1122 = _1102 * _1090;
    float _1124 = fma(_1104, _1114, _1116);
    float _1126 = fma(_1108, _1112, _1062);
    float _1128 = -_1118;
    float _1130 = fma(_1102, _1120, _1128);
    float _1132 = -_1122;
    float _1134 = fma(_1104, _1120, _1132);
    float _1136 = _924 * _1124;
    float _1138 = fma(_1100, _1120, _1062);
    float _1140 = _924 * _1130;
    float _1142 = fma(_930, _1134, _1136);
    float _1144 = fma(_1110, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1146 = fma(_930, _1138, _1140);
    float _1148 = fma(_1104, _1120, _1122);
    float _1150 = fma(_932, _1126, _1142);
    float _1152 = fma(_1102, _1120, _1118);
    float _1154 = precise::max(_1144, 0.3499999940395355224609375);
    float _1156 = fma(_932, _1148, _1146);
    float _1158 = _568 + _1150;
    float _1160 = -_1116;
    float _1162 = fma(_1104, _1114, _1160);
    float _1164 = precise::min(_1154, 1.0);
    float _1166 = _558 + _1156;
    float _1168 = -_1044;
    float _1170 = _1158 + _1168;
    float _1172 = -_1030;
    float _1174 = _1166 + _1172;
    float _1176 = fma(_1170, _1164, _1044);
    float _1178 = fma(_1174, _1164, _1030);
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1182 = _1176 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1186 = _1178 + _1184;
    float _1188 = _1182 * _1182;
    float _1190 = fma(_1186, _1186, _1188);
    float _1192 = fma(_1102, _1114, _1062);
    float _1194 = sqrt(_1190);
    float _1196 = _924 * _1192;
    float _1198 = fma(_930, _1152, _1196);
    float _1200 = fma(_932, _1162, _1198);
    float _1202 = _554 + _1200;
    bool _1204 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = -_1078;
    float _1208 = _1202 + _1206;
    float _1210 = fma(_1208, _1164, _1078);
    float _1212 = _1078;
    float _1214 = _1062;
    float _1216 = _1186;
    float _1218 = _1182;
    if (!_1204)
    {
        _1212 = _1178;
    }
    float _1220 = _1212;
    float _1222 = _1220;
    if (!_1204)
    {
        _960 = _1176;
    }
    float _1224 = _960;
    float _1226 = _1224;
    if (!_1204)
    {
        _1214 = _1210;
    }
    float _1228 = _1214;
    bool _1230 = !_1204;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1194 + _1236;
        float _1240 = rsqrt(_1190);
        float _1242 = _1238 * _1234;
        float _1244 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = _1242 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = sin(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = fma(_1250, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1258 = _1240 * _1256;
        float _1260 = _1254 + (-1.0);
        float _1262 = fma(_1186, _1258, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1264 = fma(_1182, _1258, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = fma(_1210, _1254, _1266);
        _1232 = _1268;
        _1222 = _1262;
        _1226 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = -_754;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1270);
    float _1280 = -_756;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1284 = -_788;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1290 = _1278 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1282 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1298 = _1286 + _1296;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1294, _1294, _1300);
    float _1304 = fma(_1298, _1298, _1302);
    float _1306 = rsqrt(_1304);
    float _1308 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1310 = _1294 * _1308;
    float _1312 = _1298 * _1308;
    float _1314 = _1310 * _1310;
    float _1316 = _1312 * _1312;
    float _1318 = _1314 + _1316;
    float _1320 = sqrt(_1318);
    bool _1322 = _1320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1320 + _1324;
    float _1328 = _1306;
    float _1330 = _1318;
    float _1332 = _1326;
    float _1334 = _1290;
    float _1336 = _1310;
    if (_1322)
    {
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1338;
    }
    float _1340 = _1328;
    if (_1322)
    {
        float _1342 = rsqrt(_1318);
        _1330 = _1342;
    }
    float _1344 = _1330;
    if (_1322)
    {
        float _1346 = _1326 * _1340;
        _1332 = _1346;
    }
    float _1348 = _1332;
    if (_1322)
    {
        float _1350 = _1348 * 0.15915493667125701904296875;
        _1216 = _1350;
    }
    float _1352 = _1216;
    float _1354 = _1298;
    if (_1322)
    {
        float _1356 = _1352 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1364 = precise::max(0.0, _1362);
    float _1366 = _1152;
    float _1368 = _1364;
    float _1370 = _1362;
    if (_1322)
    {
        float _1372 = _1352 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        _1366 = _1374;
    }
    float _1376 = _1366;
    float _1378 = -_1308;
    float _1380 = -_1364;
    float _1382 = fma(_1290, _1378, _1380);
    if (_1322)
    {
        float _1384 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1384;
    }
    float _1386 = _1368;
    float _1388 = _1386;
    float _1390 = _1360;
    if (_1322)
    {
        float _1392 = fma(_1360, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = _1394;
    if (!_1322)
    {
        _1390 = _1312;
    }
    float _1398 = _1390;
    float _1400 = _1398;
    if (_1322)
    {
        float _1402 = _1376 + (-1.0);
        _1370 = _1402;
    }
    float _1404 = _1370;
    float _1406 = _1404;
    if (_1322)
    {
        float _1408 = _1344 * _1394;
        _1218 = _1408;
    }
    float _1410 = _1218;
    if (!_1322)
    {
        _1396 = _1382;
    }
    float _1412 = _1396;
    float _1414 = sqrt(_1304);
    float _1416 = _1412;
    if (_1322)
    {
        float _1418 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1418;
    }
    float _1420 = _1334;
    float _1422 = _1420;
    if (_1322)
    {
        float _1424 = _1310 * _1410;
        _1336 = _1424;
    }
    float _1426 = _1336;
    if (!_1322)
    {
        _1406 = _1314;
    }
    float _1428 = _1406;
    float _1430 = _1428;
    if (_1322)
    {
        float _1432 = _1312 * _1410;
        _1400 = _1432;
    }
    float _1434 = _1400;
    if (_1322)
    {
        float _1436 = fma(_1382, _1376, _1420);
        _1416 = _1436;
    }
    float _1438 = _1416;
    if (_1322)
    {
        float _1440 = _1426 * _1426;
        _1430 = _1440;
    }
    float _1442 = _1430;
    if (!_1322)
    {
        _1422 = _1316;
    }
    float _1444 = _1422;
    float _1446 = _1444;
    if (_1322)
    {
        float _1448 = _1434 * _1434;
        _1446 = _1448;
    }
    float _1450 = _1446;
    float _1452 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1454 = fma(_1438, _1438, _1442);
    float _1456 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1458 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1452);
    float _1460 = _1454 + _1450;
    float _1462 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1456);
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1466 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1464);
    float _1468 = precise::clamp(_1466, 0.0, 1.0);
    float _1470 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1472 = rsqrt(_1460);
    float _1474 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1476 = -_1468;
    float _1478 = _1476 + 1.0;
    float _1480 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1482 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1470);
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1488 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1480);
    float _1490 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1482);
    float _1492 = abs(_1478);
    float _1494 = log2(_1492);
    float _1496 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1498 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1488);
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1502 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1506 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1508 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1510 = _1472 * _1426;
    float _1512 = _1472 * _1434;
    float _1514 = -_1502;
    float _1516 = fma(_1514, _1486, 1.0);
    float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1508);
    float _1520 = _1472 * _1438;
    float _1522 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1524 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1526 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1518);
    float _1528 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1530 = -_1522;
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1530);
    float _1534 = log2(_1516);
    float _1536 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1526);
    float _1538 = -_1512;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1532);
    float _1542 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1544 = fma(_1540, -0.5, 0.5);
    float _1546 = exp2(_1528);
    float _1548 = fma(_1540, 0.5, 0.5);
    float _1550 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1542);
    float _1552 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1524);
    float _1554 = _1520 + 1.0;
    float _1556 = fma(_1548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1558 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1550);
    float _1560 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1552);
    float _1562 = 1.0 / _1536;
    float _1564 = fma(_1548, _1556, -0.212114393711090087890625);
    float _1566 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1558);
    float _1568 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1560);
    float _1570 = _1534 * 0.693147182464599609375;
    float _1572 = fma(_1548, _1564, 1.570728778839111328125);
    float _1574 = sqrt(_1544);
    float _1576 = -_1520;
    float _1578 = fma(_1546, _1554, _1576);
    float _1580 = fma(_1578, 0.5, 0.5);
    float _1582 = _1566 * _1562;
    float _1584 = _1568 * _1562;
    float _1586 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1588 = fma(_1582, 0.5, 0.5);
    float _1590 = fma(_1584, -0.5, 0.5);
    float _1592 = _1574 * 0.636619746685028076171875;
    float _1594 = -_1572;
    float _1596 = fma(_1592, _1594, 1.0);
    float3 _4185 = float3(_1588, _1590, _1586);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4185, float3(0.0), isnan(_4185)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4185, float3(0.0), isnan(_4185)), level(0.0)).x;
    float3 _4196 = float3(_1588, _1590, _1586);
    float4 _1601 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4196, float3(0.0), isnan(_4196)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4196, float3(0.0), isnan(_4196)), level(0.0)).xyzw;
    float _1603 = _1601.x;
    float _1605 = _1601.y;
    float _1607 = _1601.z;
    float _1609 = _1601.w;
    float2 _4213 = float2(_1596, _1580);
    float3 _1611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4213, float2(0.0), isnan(_4213)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4213, float2(0.0), isnan(_4213)), level(0.0)).xyz;
    float _1613 = _1611.x;
    float _1615 = _1611.y;
    float _1617 = _1611.z;
    float _1619 = -_754;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _1623 = -_756;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _1627 = -_788;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _1631 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1633 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1631);
    float _1635 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1637 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1633);
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1635);
    bool _1641 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.5);
    bool _1649 = _1645 || _1647;
    float _1651 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1653 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1639);
    float _1655 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1659 = 1.0 / _1651;
    float _1661 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1663 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1665 = _1661 + _1651;
    float _1667 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1663);
    float _1669 = exp2(_1655);
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1649)
    {
        _1671 = 1.0;
    }
    float _1673 = _1671;
    float _1675 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1667);
    float _1677 = _1665 * _1659;
    float _1679 = _1677 * 0.5;
    float _1681 = _1673;
    if (!_1649)
    {
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1687 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1685);
        float _1689 = _1683 * 0.15915493667125701904296875;
        float _1691 = _1689 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = _1689 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = 1.0 / _1693;
        float _1705 = _1697 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        float _1709 = _1701 * _1703;
        float _1711 = 1.0 / _1687;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1713;
        float _1717 = _1707 * _1709;
        float _1719 = _1697 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = 1.0 / _1717;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1727 = _1711 * _1725;
        float _1729 = 1.0 / _1715;
        float _1731 = _1721 * _1723;
        float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1735 = fma(_1731, _1727, _1733);
        float _1737 = _1735 * _1729;
        float _1739 = precise::clamp(_1737, 0.0, 1.0);
        float _1741 = -_1739;
        float _1743 = _1741 + 1.0;
        _1681 = _1743;
    }
    float _1745 = _1681;
    float _1747 = -_1669;
    float _1749 = _1747 + 1.0;
    bool _1751 = _1745 > 0.0;
    bool _1753 = isnan(_1745);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = _1745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1763 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1765 = _1675 + _1536;
    out.m_61.x = _944;
    out.m_61.y = _946;
    out.m_61.z = _948;
    float _1767 = _1763 * _1598;
    float _1769 = -_1763;
    float _1771 = _1769 + 1.0;
    out.gl_Position.x = _1566;
    out.gl_Position.y = _1568;
    out.gl_Position.z = _1675;
    out.gl_Position.w = _1536;
    float _1773 = _1765 * 0.5;
    float _1775 = _1609 * _1767;
    float _1777 = _1617 * _1767;
    float _1779 = _1761 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1781 = _1609 * _1771;
    out.m_63.z = _1773;
    out.m_63.w = _1536;
    float _1783 = fma(_1613, _1775, _1603);
    float _1785 = fma(_1615, _1775, _1605);
    float _1787 = fma(_1609, _1777, _1607);
    out.m_47.x = _1779;
    out.m_65.x = _1783;
    out.m_65.y = _1785;
    out.m_65.z = _1787;
    out.m_65.w = _1781;
    if (_1759)
    {
        return out;
    }
    out.m_47.x = 0.0;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1789;
    return out;
}


struct dm_geometry_capture { device uint* dst; uint4 info; uint stride; short slot[144]; };
static inline void dm_cw(constant dm_geometry_capture& g, device uint* p, uint k, uint v) { short s = g.slot[k]; if (s >= 0) p[s] = v; }
vertex void main0_gs(main0_in in [[stage_in]], constant spvDescriptorSetBuffer0& spvDescriptorSet0 [[buffer(0)]], uint dm_vid [[vertex_id]], uint dm_iid [[instance_id]], constant dm_geometry_capture& dm_gs [[buffer(13)]])
{
    uint4 dm_ci = dm_gs.info; device uint* dm_capture = dm_gs.dst;
    if (dm_vid - dm_ci.x >= dm_ci.y || dm_iid - dm_ci.z >= dm_ci.w) return;
    device uint* dm_p = dm_capture + ((ulong(dm_iid - dm_ci.z) * dm_ci.y + dm_vid - dm_ci.x) * dm_gs.stride);

    main0_out out = {};
    out.m_61 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_59 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_63 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_47 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_55 = float4(0.0, 0.0, 0.0, 1.0);
    out.m_65 = float4(0.0, 0.0, 0.0, 1.0);
    bool _984 = false;
    bool _289 = false;
    out.gl_PointSize = 1.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = 0.0;
    out.gl_Position.w = 1.0;
    float _85 = in.m_44.w;
    float _87 = trunc(_85);
    int _89 = int(_87);
    bool _93 = _89 >= 1;
    float _95 = 0.0;
    if (!_93)
    {
        _95 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _97 = _95;
    float _99 = _97;
    if (!_93)
    {
        out.m_47.x = 0.0;
    }
    int _101 = 0;
    if (!_93)
    {
        float _103 = _97 * 5.0;
        _101 = as_type<int>(_103);
    }
    int _105 = _101;
    int _107 = _105;
    if (!_93)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1846 = as_type<float>(_105);
        out.gl_Position.z = _1846;
    }
    if (!_93)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _109 = in.m_49.w;
    bool _111 = _109 <= (*spvDescriptorSet0.vp_c10)._m0[2].x;
    bool _113 = isnan(_109);
    bool _115 = _111 || _113;
    bool _117 = isnan((*spvDescriptorSet0.vp_c10)._m0[2].x);
    bool _119 = _115 || _117;
    float _121 = -_109;
    float _123 = _121 + (*spvDescriptorSet0.vp_c10)._m0[2].x;
    float _125 = 0.0;
    if (_119)
    {
        float _127 = float(_89);
        _125 = _127;
    }
    float _129 = _125;
    bool _131 = _123 >= _129;
    bool _133 = !_119;
    bool _135 = _131 || _133;
    if (_135)
    {
        _99 = (*spvDescriptorSet0.vp_c8)._m0[30].y;
    }
    float _137 = _99;
    if (_135)
    {
        out.m_47.x = 0.0;
    }
    if (_135)
    {
        float _139 = _137 * 5.0;
        _107 = as_type<int>(_139);
    }
    int _141 = _107;
    if (_135)
    {
        out.gl_Position.x = 0.0;
        out.gl_Position.y = 0.0;
        float _1914 = as_type<float>(_141);
        out.gl_Position.z = _1914;
    }
    if (_135)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    float _143 = in.m_51.x;
    float _145 = _123 + (*spvDescriptorSet0.vp_c10)._m0[2].w;
    float _147 = in.m_51.y;
    bool _149 = (*spvDescriptorSet0.vp_c9)._m0[17].x != 1.0;
    bool _151 = isnan((*spvDescriptorSet0.vp_c9)._m0[17].x);
    bool _153 = _149 || _151;
    bool _155 = isnan(1.0);
    bool _157 = _153 || _155;
    float _159 = in.m_53.w;
    float _161 = in.m_49.x;
    float _163 = in.m_49.y;
    float _165 = in.m_49.z;
    float _167 = in.m_44.x;
    float _169 = in.m_44.y;
    float _171 = in.m_44.z;
    float _173 = 0.0;
    float _175 = _145;
    if (!_157)
    {
        float _177 = _145 * _145;
        float _179 = _177 * 0.5;
        _173 = _179;
    }
    float _181 = _173;
    float _183 = _181;
    if (!_157)
    {
        float _185 = _181 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _183 = _185;
    }
    float _187 = _183;
    out.m_55.x = _143;
    out.m_55.y = _147;
    bool _189 = !_157;
    float _191 = _187;
    if (!_189)
    {
        float _193 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _195 = log2(_193);
        float _197 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _199 = _197 + 1.0;
        float _201 = log2((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _203 = _145 * _195;
        float _205 = exp2(_203);
        float _207 = _201 * 0.693147182464599609375;
        float _209 = 1.0 / _207;
        float _211 = 1.0 / _199;
        float _213 = _205 + (-1.0);
        float _215 = -_213;
        float _217 = fma(_215, _209, _145);
        float _219 = _217 * _211;
        float _221 = _219 * (*spvDescriptorSet0.vp_c9)._m0[16].w;
        _191 = _221;
    }
    float _223 = _191;
    bool _225 = !_157;
    if (!_225)
    {
        float _227 = abs((*spvDescriptorSet0.vp_c9)._m0[17].x);
        float _229 = log2(_227);
        float _231 = -(*spvDescriptorSet0.vp_c9)._m0[17].x;
        float _233 = _231 + 1.0;
        float _235 = 1.0 / _233;
        float _237 = _145 * _229;
        float _239 = exp2(_237);
        float _241 = -_239;
        float _243 = _241 + 1.0;
        float _245 = _243 * _235;
        _175 = _245;
    }
    float _247 = _175;
    bool _249 = 0.0 < (*spvDescriptorSet0.vp_c9)._m0[12].x;
    float _251 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].x;
    float _253 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].y;
    float _255 = _223 * (*spvDescriptorSet0.vp_c9)._m0[16].z;
    float _257 = fma(_247, _161, _251);
    float _259 = fma(_247, _163, _253);
    float _261 = fma(_247, _165, _255);
    float _263 = fma(_257, _159, _167);
    float _265 = fma(_259, _159, _169);
    float _267 = fma(_261, _159, _171);
    bool _269 = !_249;
    float _287;
    if (!_269)
    {
        float _271 = in.m_57.x;
        float _273 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[12].x;
        float _275 = _271 * (*spvDescriptorSet0.vp_c9)._m0[13].y;
        float _277 = fma(_275, (*spvDescriptorSet0.vp_c9)._m0[12].x, _123);
        float _279 = _277 * _273;
        float _281 = floor(_279);
        float _283 = -_281;
        float _285 = _279 + _283;
        _287 = _285;
        _289 = true;
    }
    else
    {
        float _291 = float(_89);
        float _293 = 1.0 / _291;
        float _295 = _123 * _293;
        _287 = _295;
    }
    _289 = false;
    float _297 = _287;
    int _299 = int2(spvDescriptorSet0.vp_t_tcb_C.get_width(), spvDescriptorSet0.vp_t_tcb_C.get_height()).x;
    int _301 = _299;
    int _303 = 0;
    int _305 = _80(_301, _303, (*spvDescriptorSet0.support_buffer));
    float _307 = in.m_57.x;
    float _309 = 1.0 / (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _311 = (*spvDescriptorSet0.vp_c10)._m0[2].x * 0.0166666693985462188720703125;
    float _313 = _311 * (*spvDescriptorSet0.vp_c9)._m0[191].y;
    float _315 = floor(_313);
    float _317 = fma(_315, _309, _307);
    float _319 = _317 * (*spvDescriptorSet0.vp_c9)._m0[191].x;
    float _321 = float(_305);
    int _323 = abs(_305);
    float _325 = _319 * _321;
    float _327 = float(uint(_323));
    int _329 = ~_323;
    int _331 = _329 + 1;
    float _333 = trunc(_325);
    int _335 = int(_333);
    float _337 = 1.0 / _327;
    int _339 = abs(_335);
    uint _342 = uint(int(uint(_335) >> uint(31)));
    float _344 = float(uint(_339));
    int _346 = ~int(_342);
    int _348 = _346 + 1;
    int _350 = as_type<int>(_337) + (-2);
    int _352 = ~_323;
    int _354 = _352 + 1;
    float _356 = as_type<float>(_350) * _344;
    float _358 = trunc(_356);
    float _360 = precise::max(_358, 0.0);
    uint _362 = uint(_360);
    int _364 = _331 * int(_362);
    int _366 = _364 + _339;
    float _368 = float(uint(_366));
    float _370 = as_type<float>(_350) * _368;
    float _372 = trunc(_370);
    float _374 = precise::max(_372, 0.0);
    uint _376 = uint(_374);
    int _378 = ~_323;
    int _380 = _378 + 1;
    int _382 = int(_362) + int(_376);
    int _384 = _354 * _382;
    int _386 = _384 + _339;
    bool _388 = uint(_386) >= uint(_323);
    bool _390 = !_388;
    int _392 = _390 ? 0 : (-1);
    bool _394 = _305 == 0;
    int _396 = ~_382;
    int _398 = _396 + _392;
    int _400 = _398 + 1;
    int _402 = ~_323;
    int _404 = _402 + 1;
    int _406 = _323 * _400;
    int _408 = _406 + _339;
    int _410 = _408 ^ _348;
    int _412 = ~_348;
    int _414 = _412 + _410;
    int _416 = _414 + 1;
    bool _418 = !_394;
    int _420 = _418 ? _416 : (-1);
    int _422 = _420 + 1;
    int _424 = abs(_422);
    uint _426 = uint(int(uint(_422) >> uint(31)));
    float _428 = float(uint(_424));
    int _430 = ~int(_426);
    int _432 = _430 + 1;
    float _434 = as_type<float>(_350) * _428;
    float _436 = trunc(_434);
    float _438 = precise::max(_436, 0.0);
    uint _440 = uint(_438);
    int _442 = _404 * int(_440);
    int _444 = _442 + _424;
    float _446 = float(uint(_444));
    float _448 = as_type<float>(_350) * _446;
    float _450 = in.m_51.z;
    float _452 = trunc(_448);
    float _454 = precise::max(_452, 0.0);
    uint _456 = uint(_454);
    int _458 = int(_440) + int(_456);
    int _460 = _380 * _458;
    int _462 = _460 + _424;
    float _464 = trunc(_450);
    int _466 = int(_464);
    bool _468 = uint(_462) >= uint(_323);
    bool _470 = !_468;
    int _472 = _470 ? 0 : (-1);
    int _474 = ~_458;
    int _476 = _474 + _472;
    int _478 = _476 + 1;
    int _480 = _323 * _478;
    int _482 = _480 + _424;
    int _484 = _482 ^ _432;
    int _486 = ~_432;
    int _488 = _486 + _484;
    int _490 = _488 + 1;
    bool _492 = !_394;
    int _494 = _492 ? _490 : (-1);
    int _496 = _420;
    int _498 = 0;
    int _500 = _81(_496, _498, (*spvDescriptorSet0.support_buffer));
    int _502 = _466;
    int _504 = 0;
    int _506 = _81(_502, _504, (*spvDescriptorSet0.support_buffer));
    float3 _510 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_500, _506)), 0).xyz;
    float _512 = _510.x;
    float _514 = _510.y;
    float _516 = _510.z;
    int _518 = _494;
    int _520 = 0;
    int _522 = _81(_518, _520, (*spvDescriptorSet0.support_buffer));
    int _524 = _466;
    int _526 = 0;
    int _528 = _81(_524, _526, (*spvDescriptorSet0.support_buffer));
    float3 _530 = spvDescriptorSet0.vp_t_tcb_C.read(uint2(int2(_522, _528)), 0).xyz;
    float _532 = _530.x;
    float _534 = _530.y;
    float _536 = _530.z;
    float _538 = _265 * (*spvDescriptorSet0.vp_c10)._m0[5].y;
    float _540 = _265 * (*spvDescriptorSet0.vp_c10)._m0[4].y;
    float _542 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[5].x, _538);
    float _544 = _265 * (*spvDescriptorSet0.vp_c10)._m0[6].y;
    float _546 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[4].x, _540);
    float _548 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[5].z, _542);
    float _550 = fma(_263, (*spvDescriptorSet0.vp_c10)._m0[6].x, _544);
    float _552 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[4].z, _546);
    float _554 = _548 + (*spvDescriptorSet0.vp_c10)._m0[5].w;
    float _556 = fma(_267, (*spvDescriptorSet0.vp_c10)._m0[6].z, _550);
    float _558 = _552 + (*spvDescriptorSet0.vp_c10)._m0[4].w;
    float _560 = -(*spvDescriptorSet0.vp_c9)._m0[143].y;
    float _562 = (*spvDescriptorSet0.vp_c9)._m0[144].y + _560;
    float _564 = -_554;
    float _566 = _564 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _568 = _556 + (*spvDescriptorSet0.vp_c10)._m0[6].w;
    float _570 = -_558;
    float _572 = _570 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _574 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _576 = _554 + _574;
    float _578 = _566 * _566;
    float _580 = -_568;
    float _582 = _580 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _584 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _586 = _558 + _584;
    float _588 = -(*spvDescriptorSet0.vp_c9)._m0[143].z;
    float _590 = (*spvDescriptorSet0.vp_c9)._m0[144].z + _588;
    float _592 = fma(_572, _572, _578);
    float _594 = -(*spvDescriptorSet0.vp_c9)._m0[144].y;
    float _596 = _594 + (*spvDescriptorSet0.vp_c9)._m0[145].y;
    float _598 = -(*spvDescriptorSet0.vp_c9)._m0[144].z;
    float _600 = _598 + (*spvDescriptorSet0.vp_c9)._m0[145].z;
    bool _602 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[143].w;
    bool _604 = isnan(_297);
    bool _606 = _602 || _604;
    bool _608 = isnan((*spvDescriptorSet0.vp_c9)._m0[143].w);
    bool _610 = _606 || _608;
    float _612 = float(_610);
    float _614 = fma(_582, _582, _592);
    float _616 = rsqrt(_614);
    float _618 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _620 = (*spvDescriptorSet0.vp_c9)._m0[144].w + _618;
    float _622 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _624 = _622 + (*spvDescriptorSet0.vp_c9)._m0[145].w;
    float _626 = 1.0 / _620;
    float _628 = _582 * _616;
    float _630 = _572 * _616;
    float _632 = _566 * _616;
    float _634 = 1.0 / _624;
    float _636 = _628 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _638 = -(*spvDescriptorSet0.vp_c9)._m0[143].w;
    float _640 = _297 + _638;
    float _642 = _632 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _644 = -_636;
    float _646 = fma(_630, (*spvDescriptorSet0.vp_c10)._m0[10].y, _644);
    float _648 = _630 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _650 = -_642;
    float _652 = fma(_628, (*spvDescriptorSet0.vp_c10)._m0[9].y, _650);
    float _654 = -(*spvDescriptorSet0.vp_c9)._m0[144].w;
    float _656 = _297 + _654;
    float _658 = _646 * _646;
    float _660 = -_648;
    float _662 = fma(_632, (*spvDescriptorSet0.vp_c10)._m0[8].y, _660);
    float _664 = _576 * _576;
    float _666 = fma(_652, _652, _658);
    float _668 = _640 * _626;
    float _670 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _672 = _568 + _670;
    float _674 = fma(_586, _586, _664);
    float _676 = fma(_662, _662, _666);
    float _678 = _656 * _634;
    float _680 = -(*spvDescriptorSet0.vp_c9)._m0[143].x;
    float _682 = (*spvDescriptorSet0.vp_c9)._m0[144].x + _680;
    float _684 = fma(_672, _672, _674);
    float _686 = -(*spvDescriptorSet0.vp_c9)._m0[144].x;
    float _688 = _686 + (*spvDescriptorSet0.vp_c9)._m0[145].x;
    float _690 = fma(_562, _668, (*spvDescriptorSet0.vp_c9)._m0[143].y);
    float _692 = rsqrt(_676);
    float _694 = fma(_682, _668, (*spvDescriptorSet0.vp_c9)._m0[143].x);
    float _696 = fma(_590, _668, (*spvDescriptorSet0.vp_c9)._m0[143].z);
    float _698 = fma(_688, _678, (*spvDescriptorSet0.vp_c9)._m0[144].x);
    float _700 = fma(_596, _678, (*spvDescriptorSet0.vp_c9)._m0[144].y);
    float _702 = fma(_600, _678, (*spvDescriptorSet0.vp_c9)._m0[144].z);
    bool _704 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[145].w;
    bool _706 = isnan(_297);
    bool _708 = _704 || _706;
    bool _710 = isnan((*spvDescriptorSet0.vp_c9)._m0[145].w);
    bool _712 = _708 || _710;
    float _714 = float(_712);
    float _716 = rsqrt(_684);
    float _718 = -_714;
    float _720 = _718 + 1.0;
    float _722 = _652 * _692;
    float _724 = _646 * _692;
    float _726 = _662 * _692;
    float _728 = _722 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _730 = _724 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _732 = _726 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _734 = -_728;
    float _736 = fma(_726, (*spvDescriptorSet0.vp_c10)._m0[8].y, _734);
    bool _738 = _297 >= (*spvDescriptorSet0.vp_c9)._m0[144].w;
    bool _740 = isnan(_297);
    bool _742 = _738 || _740;
    bool _744 = isnan((*spvDescriptorSet0.vp_c9)._m0[144].w);
    bool _746 = _742 || _744;
    float _748 = float(_746);
    float _750 = -_732;
    float _752 = fma(_724, (*spvDescriptorSet0.vp_c10)._m0[10].y, _750);
    float _754 = _576 * _716;
    float _756 = _586 * _716;
    float _758 = _736 * _736;
    float _760 = -_730;
    float _762 = fma(_722, (*spvDescriptorSet0.vp_c10)._m0[9].y, _760);
    float _764 = -_754;
    float _766 = fma(_764, (*spvDescriptorSet0.vp_c9)._m0[18].w, _576);
    float _768 = -_756;
    float _770 = fma(_768, (*spvDescriptorSet0.vp_c9)._m0[18].w, _586);
    float _772 = fma(_752, _752, _758);
    float _774 = in.m_53.x;
    float _776 = in.m_53.y;
    float _778 = in.m_53.z;
    float _780 = _766 * _766;
    float _782 = _748 * _720;
    float _784 = -_748;
    float _786 = _784 + 1.0;
    float _788 = _672 * _716;
    float _790 = fma(_770, _770, _780);
    float _792 = fma(_762, _762, _772);
    float _794 = _612 * _786;
    float _796 = -_788;
    float _798 = fma(_796, (*spvDescriptorSet0.vp_c9)._m0[18].w, _672);
    float _800 = -_612;
    float _802 = _800 + 1.0;
    float _804 = _690 * _794;
    float _806 = fma(_798, _798, _790);
    float _808 = rsqrt(_792);
    float _810 = _694 * _794;
    float _812 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].y, _804);
    float _814 = _696 * _794;
    float _816 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].x, _810);
    float _818 = fma(_700, _782, _812);
    float _820 = fma(_802, (*spvDescriptorSet0.vp_c9)._m0[143].z, _814);
    float _822 = sqrt(_806);
    float _824 = fma(_698, _782, _816);
    float _826 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].y, _818);
    float _828 = fma(_702, _782, _820);
    float _830 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].x, _824);
    float _832 = _826 * _776;
    float _834 = floor(_325);
    float _836 = _736 * _808;
    float _838 = _752 * _808;
    float _840 = _832 * (*spvDescriptorSet0.vp_c10)._m0[3].z;
    float _842 = _762 * _808;
    float _844 = _836 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _846 = _830 * _774;
    float _848 = fma(_714, (*spvDescriptorSet0.vp_c9)._m0[145].z, _828);
    float _850 = _716 * _822;
    float _852 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[8].z, _844);
    float _854 = _846 * (*spvDescriptorSet0.vp_c10)._m0[3].y;
    float _856 = _848 * _778;
    float _858 = _840 * _850;
    float _860 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[10].z, _852);
    float _862 = _854 * _850;
    float _864 = _856 * (*spvDescriptorSet0.vp_c10)._m0[3].w;
    float _866 = -_834;
    float _868 = _325 + _866;
    float _870 = abs(_860);
    float _872 = -_870;
    float _874 = _872 + 1.0;
    float _876 = _864 * _850;
    float _878 = -_514;
    float _880 = _878 + _534;
    float _882 = -_512;
    float _884 = _882 + _532;
    float _886 = -_516;
    float _888 = _886 + _536;
    int _890 = as_type<int>(_874) + (-218103808);
    float _892 = fma(_868, _880, _514);
    float _894 = fma(_868, _884, _512);
    float _896 = fma(_868, _888, _516);
    bool _898 = uint(_890) >= 1920991232u;
    float _900 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].y, _892);
    float _902 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].x, _894);
    float _904 = fma(0.5, (*spvDescriptorSet0.vp_c9)._m0[18].z, _896);
    out.m_59.y = _892;
    float _906 = _858 * _900;
    float _908 = _862 * _902;
    float _910 = _876 * _904;
    float _912 = _906 * (*spvDescriptorSet0.vp_c10)._m0[9].y;
    float _914 = _906 * (*spvDescriptorSet0.vp_c10)._m0[8].y;
    float _916 = _906 * (*spvDescriptorSet0.vp_c10)._m0[10].y;
    float _918 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[9].x, _912);
    float _920 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[8].x, _914);
    float _922 = fma(_908, (*spvDescriptorSet0.vp_c10)._m0[10].x, _916);
    float _924 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[9].z, _918);
    float _926 = abs(_860);
    float _928 = fma(_926, -0.0187292993068695068359375, 0.074261002242565155029296875);
    float _930 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[8].z, _920);
    float _932 = fma(_910, (*spvDescriptorSet0.vp_c10)._m0[10].z, _922);
    float _934 = (*spvDescriptorSet0.vp_c9)._m0[107].x * (*spvDescriptorSet0.vp_c10)._m0[0].x;
    float _936 = (*spvDescriptorSet0.vp_c9)._m0[107].y * (*spvDescriptorSet0.vp_c10)._m0[0].y;
    float _938 = (*spvDescriptorSet0.vp_c9)._m0[107].z * (*spvDescriptorSet0.vp_c10)._m0[0].z;
    float _940 = abs(_860);
    float _942 = fma(_940, _928, -0.212114393711090087890625);
    float _944 = _934 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _946 = _936 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _948 = _938 * (*spvDescriptorSet0.vp_c9)._m0[106].x;
    float _950 = abs(_860);
    float _952 = fma(_950, _942, 1.570728778839111328125);
    bool _954 = _860 < 0.0;
    float _956 = float(_954);
    bool _958 = !_898;
    float _960 = _930;
    float _982;
    if (!_958)
    {
        int _962 = as_type<int>((*spvDescriptorSet0.vp_c9)._m0[107].y);
        int _964 = as_type<int>(_874);
        int _966 = as_type<int>(_858);
        int _968 = 4960;
        int _970;
        int _972;
        int _974;
        int _976;
        int _978;
        int _980;
        _78(_962, _964, _966, _968, _970, _972, _974, _976, _978, _980, out.gl_Position, out.gl_PointSize);
        _982 = as_type<float>(_970);
        _984 = true;
    }
    else
    {
        float _986 = rsqrt(_874);
        float _988 = _874 * _986;
        float _990 = _986 * 0.5;
        float _992 = -_988;
        float _994 = 0.0 + _992;
        float _996 = fma(_990, _994, 0.5);
        float _998 = fma(_988, _996, _988);
        float _1000 = -_998;
        float _1002 = 0.0 + _1000;
        float _1004 = fma(_998, _1002, _874);
        float _1006 = fma(_990, _1004, _998);
        _982 = _1006;
    }
    _984 = false;
    float _1008 = _982;
    float _1010 = _842 * (*spvDescriptorSet0.vp_c10)._m0[8].z;
    float _1012 = _836 * (*spvDescriptorSet0.vp_c10)._m0[10].z;
    float _1014 = _952 * _1008;
    float _1016 = -_1010;
    float _1018 = fma(_838, (*spvDescriptorSet0.vp_c10)._m0[10].z, _1016);
    float _1020 = -_1012;
    float _1022 = fma(_842, (*spvDescriptorSet0.vp_c10)._m0[9].z, _1020);
    float _1024 = _838 * (*spvDescriptorSet0.vp_c10)._m0[9].z;
    float _1026 = _1018 * _1018;
    float _1028 = -(*spvDescriptorSet0.vp_c9)._m0[192].y;
    float _1030 = (*spvDescriptorSet0.vp_c10)._m0[8].w + _1028;
    float _1032 = -_1024;
    float _1034 = fma(_836, (*spvDescriptorSet0.vp_c10)._m0[8].z, _1032);
    float _1036 = fma(_1022, _1022, _1026);
    float _1038 = -_1030;
    float _1040 = _1038 + (*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1042 = -(*spvDescriptorSet0.vp_c9)._m0[192].w;
    float _1044 = (*spvDescriptorSet0.vp_c10)._m0[10].w + _1042;
    float _1046 = fma(_1034, _1034, _1036);
    float _1048 = _956 * 2.0;
    float _1050 = rsqrt(_1046);
    float _1052 = -_1048;
    float _1054 = fma(_1014, _1052, _1014);
    float _1056 = fma(_956, 3.1415927410125732421875, _1054);
    float _1058 = _1056 * 0.15915493667125701904296875;
    float _1060 = _1058 * 6.283185482025146484375;
    float _1062 = cos(_1060);
    float _1064 = _1018 * _1050;
    float _1066 = _1022 * _1050;
    float _1068 = _1034 * _1050;
    float _1070 = _1064 * _1064;
    float _1072 = fma(_1066, _1066, _1070);
    float _1074 = fma(_1068, _1068, _1072);
    float _1076 = -(*spvDescriptorSet0.vp_c9)._m0[192].z;
    float _1078 = (*spvDescriptorSet0.vp_c10)._m0[9].w + _1076;
    float _1080 = rsqrt(_1074);
    float _1082 = -_1078;
    float _1084 = _1082 + (*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1086 = _1084 * _1084;
    float _1088 = _1058 * 6.283185482025146484375;
    float _1090 = sin(_1088);
    float _1092 = fma(_1040, _1040, _1086);
    float _1094 = -_1044;
    float _1096 = _1094 + (*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1098 = fma(_1096, _1096, _1092);
    float _1100 = _1066 * _1080;
    float _1102 = _1064 * _1080;
    float _1104 = _1068 * _1080;
    float _1106 = -_1062;
    float _1108 = _1106 + 1.0;
    float _1110 = sqrt(_1098);
    float _1112 = _1104 * _1104;
    float _1114 = _1102 * _1108;
    float _1116 = _1100 * _1090;
    float _1118 = _1104 * _1090;
    float _1120 = _1100 * _1108;
    float _1122 = _1102 * _1090;
    float _1124 = fma(_1104, _1114, _1116);
    float _1126 = fma(_1108, _1112, _1062);
    float _1128 = -_1118;
    float _1130 = fma(_1102, _1120, _1128);
    float _1132 = -_1122;
    float _1134 = fma(_1104, _1120, _1132);
    float _1136 = _924 * _1124;
    float _1138 = fma(_1100, _1120, _1062);
    float _1140 = _924 * _1130;
    float _1142 = fma(_930, _1134, _1136);
    float _1144 = fma(_1110, 0.0068421051837503910064697265625, 0.3157894611358642578125);
    float _1146 = fma(_930, _1138, _1140);
    float _1148 = fma(_1104, _1120, _1122);
    float _1150 = fma(_932, _1126, _1142);
    float _1152 = fma(_1102, _1120, _1118);
    float _1154 = precise::max(_1144, 0.3499999940395355224609375);
    float _1156 = fma(_932, _1148, _1146);
    float _1158 = _568 + _1150;
    float _1160 = -_1116;
    float _1162 = fma(_1104, _1114, _1160);
    float _1164 = precise::min(_1154, 1.0);
    float _1166 = _558 + _1156;
    float _1168 = -_1044;
    float _1170 = _1158 + _1168;
    float _1172 = -_1030;
    float _1174 = _1166 + _1172;
    float _1176 = fma(_1170, _1164, _1044);
    float _1178 = fma(_1174, _1164, _1030);
    float _1180 = -(*spvDescriptorSet0.vp_c15)._m0[0].z;
    float _1182 = _1176 + _1180;
    float _1184 = -(*spvDescriptorSet0.vp_c15)._m0[0].x;
    float _1186 = _1178 + _1184;
    float _1188 = _1182 * _1182;
    float _1190 = fma(_1186, _1186, _1188);
    float _1192 = fma(_1102, _1114, _1062);
    float _1194 = sqrt(_1190);
    float _1196 = _924 * _1192;
    float _1198 = fma(_930, _1152, _1196);
    float _1200 = fma(_932, _1162, _1198);
    float _1202 = _554 + _1200;
    bool _1204 = _1194 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1206 = -_1078;
    float _1208 = _1202 + _1206;
    float _1210 = fma(_1208, _1164, _1078);
    float _1212 = _1078;
    float _1214 = _1062;
    float _1216 = _1186;
    float _1218 = _1182;
    if (!_1204)
    {
        _1212 = _1178;
    }
    float _1220 = _1212;
    float _1222 = _1220;
    if (!_1204)
    {
        _960 = _1176;
    }
    float _1224 = _960;
    float _1226 = _1224;
    if (!_1204)
    {
        _1214 = _1210;
    }
    float _1228 = _1214;
    bool _1230 = !_1204;
    float _1232 = _1228;
    if (!_1230)
    {
        float _1234 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1236 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
        float _1238 = _1194 + _1236;
        float _1240 = rsqrt(_1190);
        float _1242 = _1238 * _1234;
        float _1244 = _1210 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1246 = _1242 * 0.15915493667125701904296875;
        float _1248 = _1246 * 6.283185482025146484375;
        float _1250 = sin(_1248);
        float _1252 = _1246 * 6.283185482025146484375;
        float _1254 = cos(_1252);
        float _1256 = fma(_1250, _1244, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        float _1258 = _1240 * _1256;
        float _1260 = _1254 + (-1.0);
        float _1262 = fma(_1186, _1258, (*spvDescriptorSet0.vp_c15)._m0[0].x);
        float _1264 = fma(_1182, _1258, (*spvDescriptorSet0.vp_c15)._m0[0].z);
        float _1266 = _1260 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        float _1268 = fma(_1210, _1254, _1266);
        _1232 = _1268;
        _1222 = _1262;
        _1226 = _1264;
    }
    float _1270 = _1232;
    float _1272 = _1222;
    float _1274 = _1226;
    float _1276 = -_754;
    float _1278 = fma(_1276, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1270);
    float _1280 = -_756;
    float _1282 = fma(_1280, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1272);
    float _1284 = -_788;
    float _1286 = fma(_1284, (*spvDescriptorSet0.vp_c9)._m0[18].w, _1274);
    float _1288 = -(*spvDescriptorSet0.vp_c8)._m0[29].y;
    float _1290 = _1278 + _1288;
    float _1292 = -(*spvDescriptorSet0.vp_c8)._m0[29].x;
    float _1294 = _1282 + _1292;
    float _1296 = -(*spvDescriptorSet0.vp_c8)._m0[29].z;
    float _1298 = _1286 + _1296;
    float _1300 = _1290 * _1290;
    float _1302 = fma(_1294, _1294, _1300);
    float _1304 = fma(_1298, _1298, _1302);
    float _1306 = rsqrt(_1304);
    float _1308 = _1306 * (*spvDescriptorSet0.vp_c15)._m0[24].y;
    float _1310 = _1294 * _1308;
    float _1312 = _1298 * _1308;
    float _1314 = _1310 * _1310;
    float _1316 = _1312 * _1312;
    float _1318 = _1314 + _1316;
    float _1320 = sqrt(_1318);
    bool _1322 = _1320 > (*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1324 = -(*spvDescriptorSet0.vp_c15)._m0[1].x;
    float _1326 = _1320 + _1324;
    float _1328 = _1306;
    float _1330 = _1318;
    float _1332 = _1326;
    float _1334 = _1290;
    float _1336 = _1310;
    if (_1322)
    {
        float _1338 = 1.0 / (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1328 = _1338;
    }
    float _1340 = _1328;
    if (_1322)
    {
        float _1342 = rsqrt(_1318);
        _1330 = _1342;
    }
    float _1344 = _1330;
    if (_1322)
    {
        float _1346 = _1326 * _1340;
        _1332 = _1346;
    }
    float _1348 = _1332;
    if (_1322)
    {
        float _1350 = _1348 * 0.15915493667125701904296875;
        _1216 = _1350;
    }
    float _1352 = _1216;
    float _1354 = _1298;
    if (_1322)
    {
        float _1356 = _1352 * 6.283185482025146484375;
        float _1358 = sin(_1356);
        _1354 = _1358;
    }
    float _1360 = _1354;
    float _1362 = (*spvDescriptorSet0.vp_c8)._m0[29].y + (-220.0);
    float _1364 = precise::max(0.0, _1362);
    float _1366 = _1152;
    float _1368 = _1364;
    float _1370 = _1362;
    if (_1322)
    {
        float _1372 = _1352 * 6.283185482025146484375;
        float _1374 = cos(_1372);
        _1366 = _1374;
    }
    float _1376 = _1366;
    float _1378 = -_1308;
    float _1380 = -_1364;
    float _1382 = fma(_1290, _1378, _1380);
    if (_1322)
    {
        float _1384 = _1382 + (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1368 = _1384;
    }
    float _1386 = _1368;
    float _1388 = _1386;
    float _1390 = _1360;
    if (_1322)
    {
        float _1392 = fma(_1360, _1386, (*spvDescriptorSet0.vp_c15)._m0[1].x);
        _1388 = _1392;
    }
    float _1394 = _1388;
    float _1396 = _1394;
    if (!_1322)
    {
        _1390 = _1312;
    }
    float _1398 = _1390;
    float _1400 = _1398;
    if (_1322)
    {
        float _1402 = _1376 + (-1.0);
        _1370 = _1402;
    }
    float _1404 = _1370;
    float _1406 = _1404;
    if (_1322)
    {
        float _1408 = _1344 * _1394;
        _1218 = _1408;
    }
    float _1410 = _1218;
    if (!_1322)
    {
        _1396 = _1382;
    }
    float _1412 = _1396;
    float _1414 = sqrt(_1304);
    float _1416 = _1412;
    if (_1322)
    {
        float _1418 = _1404 * (*spvDescriptorSet0.vp_c15)._m0[1].y;
        _1334 = _1418;
    }
    float _1420 = _1334;
    float _1422 = _1420;
    if (_1322)
    {
        float _1424 = _1310 * _1410;
        _1336 = _1424;
    }
    float _1426 = _1336;
    if (!_1322)
    {
        _1406 = _1314;
    }
    float _1428 = _1406;
    float _1430 = _1428;
    if (_1322)
    {
        float _1432 = _1312 * _1410;
        _1400 = _1432;
    }
    float _1434 = _1400;
    if (_1322)
    {
        float _1436 = fma(_1382, _1376, _1420);
        _1416 = _1436;
    }
    float _1438 = _1416;
    if (_1322)
    {
        float _1440 = _1426 * _1426;
        _1430 = _1440;
    }
    float _1442 = _1430;
    if (!_1322)
    {
        _1422 = _1316;
    }
    float _1444 = _1422;
    float _1446 = _1444;
    if (_1322)
    {
        float _1448 = _1434 * _1434;
        _1446 = _1448;
    }
    float _1450 = _1446;
    float _1452 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[3].y;
    float _1454 = fma(_1438, _1438, _1442);
    float _1456 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[2].y;
    float _1458 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[3].x, _1452);
    float _1460 = _1454 + _1450;
    float _1462 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[2].x, _1456);
    float _1464 = -(*spvDescriptorSet0.vp_c15)._m0[23].z;
    float _1466 = fma(_1414, (*spvDescriptorSet0.vp_c15)._m0[23].w, _1464);
    float _1468 = precise::clamp(_1466, 0.0, 1.0);
    float _1470 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[1].y;
    float _1472 = rsqrt(_1460);
    float _1474 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[2].z, _1462);
    float _1476 = -_1468;
    float _1478 = _1476 + 1.0;
    float _1480 = _1278 * (*spvDescriptorSet0.vp_c8)._m0[0].y;
    float _1482 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[1].x, _1470);
    float _1484 = _1474 + (*spvDescriptorSet0.vp_c8)._m0[2].w;
    float _1486 = (*spvDescriptorSet0.vp_c15)._m0[20].x + (-1.0);
    float _1488 = fma(_1282, (*spvDescriptorSet0.vp_c8)._m0[0].x, _1480);
    float _1490 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[1].z, _1482);
    float _1492 = abs(_1478);
    float _1494 = log2(_1492);
    float _1496 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[3].z, _1458);
    float _1498 = fma(_1286, (*spvDescriptorSet0.vp_c8)._m0[0].z, _1488);
    float _1500 = _1490 + (*spvDescriptorSet0.vp_c8)._m0[1].w;
    float _1502 = _1484 * (*spvDescriptorSet0.vp_c15)._m0[19].w;
    float _1504 = _1496 + (*spvDescriptorSet0.vp_c8)._m0[3].w;
    float _1506 = _1498 + (*spvDescriptorSet0.vp_c8)._m0[0].w;
    float _1508 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[7].y;
    float _1510 = _1472 * _1426;
    float _1512 = _1472 * _1434;
    float _1514 = -_1502;
    float _1516 = fma(_1514, _1486, 1.0);
    float _1518 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[7].x, _1508);
    float _1520 = _1472 * _1438;
    float _1522 = _1510 * (*spvDescriptorSet0.vp_c15)._m0[21].x;
    float _1524 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[5].y;
    float _1526 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[7].z, _1518);
    float _1528 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].y;
    float _1530 = -_1522;
    float _1532 = fma(_1520, (*spvDescriptorSet0.vp_c15)._m0[21].y, _1530);
    float _1534 = log2(_1516);
    float _1536 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[7].w, _1526);
    float _1538 = -_1512;
    float _1540 = fma(_1538, (*spvDescriptorSet0.vp_c15)._m0[21].z, _1532);
    float _1542 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[4].y;
    float _1544 = fma(_1540, -0.5, 0.5);
    float _1546 = exp2(_1528);
    float _1548 = fma(_1540, 0.5, 0.5);
    float _1550 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[4].x, _1542);
    float _1552 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[5].x, _1524);
    float _1554 = _1520 + 1.0;
    float _1556 = fma(_1548, -0.0187292993068695068359375, 0.07426099479198455810546875);
    float _1558 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[4].z, _1550);
    float _1560 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[5].z, _1552);
    float _1562 = 1.0 / _1536;
    float _1564 = fma(_1548, _1556, -0.212114393711090087890625);
    float _1566 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[4].w, _1558);
    float _1568 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[5].w, _1560);
    float _1570 = _1534 * 0.693147182464599609375;
    float _1572 = fma(_1548, _1564, 1.570728778839111328125);
    float _1574 = sqrt(_1544);
    float _1576 = -_1520;
    float _1578 = fma(_1546, _1554, _1576);
    float _1580 = fma(_1578, 0.5, 0.5);
    float _1582 = _1566 * _1562;
    float _1584 = _1568 * _1562;
    float _1586 = _1570 * (*spvDescriptorSet0.vp_c15)._m0[20].y;
    float _1588 = fma(_1582, 0.5, 0.5);
    float _1590 = fma(_1584, -0.5, 0.5);
    float _1592 = _1574 * 0.636619746685028076171875;
    float _1594 = -_1572;
    float _1596 = fma(_1592, _1594, 1.0);
    float3 _4185 = float3(_1588, _1590, _1586);
    float _1598 = dm_bs(spvDescriptorSet0.vp_t_tcb_32.sample(spvDescriptorSet0.vp_t_tcb_32Smplr, select(_4185, float3(0.0), isnan(_4185)), level(0.0)), spvDescriptorSet0.dm_border, 0u, spvDescriptorSet0.vp_t_tcb_32, spvDescriptorSet0.vp_t_tcb_32Smplr_w, select(_4185, float3(0.0), isnan(_4185)), level(0.0)).x;
    float3 _4196 = float3(_1588, _1590, _1586);
    float4 _1601 = dm_bs(spvDescriptorSet0.vp_t_tcb_30.sample(spvDescriptorSet0.vp_t_tcb_30Smplr, select(_4196, float3(0.0), isnan(_4196)), level(0.0)), spvDescriptorSet0.dm_border, 1u, spvDescriptorSet0.vp_t_tcb_30, spvDescriptorSet0.vp_t_tcb_30Smplr_w, select(_4196, float3(0.0), isnan(_4196)), level(0.0)).xyzw;
    float _1603 = _1601.x;
    float _1605 = _1601.y;
    float _1607 = _1601.z;
    float _1609 = _1601.w;
    float2 _4213 = float2(_1596, _1580);
    float3 _1611 = dm_bs(spvDescriptorSet0.vp_t_tcb_1C.sample(spvDescriptorSet0.vp_t_tcb_1CSmplr, select(_4213, float2(0.0), isnan(_4213)), level(0.0)), spvDescriptorSet0.dm_border, 2u, spvDescriptorSet0.vp_t_tcb_1C, spvDescriptorSet0.vp_t_tcb_1CSmplr_w, select(_4213, float2(0.0), isnan(_4213)), level(0.0)).xyz;
    float _1613 = _1611.x;
    float _1615 = _1611.y;
    float _1617 = _1611.z;
    float _1619 = -_754;
    float _1621 = fma(_1619, (*spvDescriptorSet0.vp_c9)._m0[18].w, _554);
    float _1623 = -_756;
    float _1625 = fma(_1623, (*spvDescriptorSet0.vp_c9)._m0[18].w, _558);
    float _1627 = -_788;
    float _1629 = fma(_1627, (*spvDescriptorSet0.vp_c9)._m0[18].w, _568);
    float _1631 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[11].y;
    float _1633 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[11].x, _1631);
    float _1635 = _1621 * (*spvDescriptorSet0.vp_c8)._m0[10].y;
    float _1637 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[11].z, _1633);
    float _1639 = fma(_1625, (*spvDescriptorSet0.vp_c8)._m0[10].x, _1635);
    bool _1641 = (*spvDescriptorSet0.vp_c15)._m0[653].w >= 0.5;
    bool _1643 = isnan((*spvDescriptorSet0.vp_c15)._m0[653].w);
    bool _1645 = _1641 || _1643;
    bool _1647 = isnan(0.5);
    bool _1649 = _1645 || _1647;
    float _1651 = _1637 + (*spvDescriptorSet0.vp_c8)._m0[11].w;
    float _1653 = fma(_1629, (*spvDescriptorSet0.vp_c8)._m0[10].z, _1639);
    float _1655 = _1494 * (*spvDescriptorSet0.vp_c15)._m0[23].x;
    float _1657 = _1500 * (*spvDescriptorSet0.vp_c8)._m0[6].y;
    float _1659 = 1.0 / _1651;
    float _1661 = _1653 + (*spvDescriptorSet0.vp_c8)._m0[10].w;
    float _1663 = fma(_1506, (*spvDescriptorSet0.vp_c8)._m0[6].x, _1657);
    float _1665 = _1661 + _1651;
    float _1667 = fma(_1484, (*spvDescriptorSet0.vp_c8)._m0[6].z, _1663);
    float _1669 = exp2(_1655);
    float _1671 = (*spvDescriptorSet0.vp_c15)._m0[653].w;
    if (_1649)
    {
        _1671 = 1.0;
    }
    float _1673 = _1671;
    float _1675 = fma(_1504, (*spvDescriptorSet0.vp_c8)._m0[6].w, _1667);
    float _1677 = _1665 * _1659;
    float _1679 = _1677 * 0.5;
    float _1681 = _1673;
    if (!_1649)
    {
        float _1683 = (*spvDescriptorSet0.vp_c8)._m0[31].x * 0.5;
        float _1685 = -(*spvDescriptorSet0.vp_c8)._m0[30].y;
        float _1687 = fma(_1679, (*spvDescriptorSet0.vp_c8)._m0[30].w, _1685);
        float _1689 = _1683 * 0.15915493667125701904296875;
        float _1691 = _1689 * 6.283185482025146484375;
        float _1693 = cos(_1691);
        float _1695 = (*spvDescriptorSet0.vp_c8)._m0[31].y * 0.5;
        float _1697 = _1695 * 0.15915493667125701904296875;
        float _1699 = _1689 * 6.283185482025146484375;
        float _1701 = sin(_1699);
        float _1703 = 1.0 / _1693;
        float _1705 = _1697 * 6.283185482025146484375;
        float _1707 = cos(_1705);
        float _1709 = _1701 * _1703;
        float _1711 = 1.0 / _1687;
        float _1713 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1715 = (*spvDescriptorSet0.vp_c9)._m0[140].w + _1713;
        float _1717 = _1707 * _1709;
        float _1719 = _1697 * 6.283185482025146484375;
        float _1721 = sin(_1719);
        float _1723 = 1.0 / _1717;
        float _1725 = -(*spvDescriptorSet0.vp_c8)._m0[30].z;
        float _1727 = _1711 * _1725;
        float _1729 = 1.0 / _1715;
        float _1731 = _1721 * _1723;
        float _1733 = -(*spvDescriptorSet0.vp_c9)._m0[140].z;
        float _1735 = fma(_1731, _1727, _1733);
        float _1737 = _1735 * _1729;
        float _1739 = precise::clamp(_1737, 0.0, 1.0);
        float _1741 = -_1739;
        float _1743 = _1741 + 1.0;
        _1681 = _1743;
    }
    float _1745 = _1681;
    float _1747 = -_1669;
    float _1749 = _1747 + 1.0;
    bool _1751 = _1745 > 0.0;
    bool _1753 = isnan(_1745);
    bool _1755 = _1751 || _1753;
    bool _1757 = isnan(0.0);
    bool _1759 = _1755 || _1757;
    float _1761 = _1745 * (*spvDescriptorSet0.vp_c10)._m0[3].x;
    float _1763 = _1749 * (*spvDescriptorSet0.vp_c15)._m0[24].x;
    float _1765 = _1675 + _1536;
    out.m_61.x = _944;
    out.m_61.y = _946;
    out.m_61.z = _948;
    float _1767 = _1763 * _1598;
    float _1769 = -_1763;
    float _1771 = _1769 + 1.0;
    out.gl_Position.x = _1566;
    out.gl_Position.y = _1568;
    out.gl_Position.z = _1675;
    out.gl_Position.w = _1536;
    float _1773 = _1765 * 0.5;
    float _1775 = _1609 * _1767;
    float _1777 = _1617 * _1767;
    float _1779 = _1761 * (*spvDescriptorSet0.vp_c7)._m0[2].w;
    float _1781 = _1609 * _1771;
    out.m_63.z = _1773;
    out.m_63.w = _1536;
    float _1783 = fma(_1613, _1775, _1603);
    float _1785 = fma(_1615, _1775, _1605);
    float _1787 = fma(_1609, _1777, _1607);
    out.m_47.x = _1779;
    out.m_65.x = _1783;
    out.m_65.y = _1785;
    out.m_65.z = _1787;
    out.m_65.w = _1781;
    if (_1759)
    {
        { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
    }
    out.m_47.x = 0.0;
    float _1789 = (*spvDescriptorSet0.vp_c8)._m0[30].y * 5.0;
    out.gl_Position.x = 0.0;
    out.gl_Position.y = 0.0;
    out.gl_Position.z = _1789;
    { dm_cw(dm_gs, dm_p, 0, as_type<uint>(out.gl_Position.x)); dm_cw(dm_gs, dm_p, 1, as_type<uint>(out.gl_Position.y)); dm_cw(dm_gs, dm_p, 2, as_type<uint>(out.gl_Position.z)); dm_cw(dm_gs, dm_p, 3, as_type<uint>(out.gl_Position.w)); dm_cw(dm_gs, dm_p, 4, as_type<uint>(out.gl_PointSize)); dm_cw(dm_gs, dm_p, 5, 0u); dm_cw(dm_gs, dm_p, 6, 0u); dm_cw(dm_gs, dm_p, 7, 0u); dm_cw(dm_gs, dm_p, 8, 0u); dm_cw(dm_gs, dm_p, 9, 0u); dm_cw(dm_gs, dm_p, 10, 0u); dm_cw(dm_gs, dm_p, 11, 0u); dm_cw(dm_gs, dm_p, 12, 0u); dm_cw(dm_gs, dm_p, 13, 0u); dm_cw(dm_gs, dm_p, 14, 0u); dm_cw(dm_gs, dm_p, 15, 0u); dm_cw(dm_gs, dm_p, 16, as_type<uint>(out.m_61.x)); dm_cw(dm_gs, dm_p, 17, as_type<uint>(out.m_61.y)); dm_cw(dm_gs, dm_p, 18, as_type<uint>(out.m_61.z)); dm_cw(dm_gs, dm_p, 19, as_type<uint>(out.m_61.w)); dm_cw(dm_gs, dm_p, 20, as_type<uint>(out.m_59.x)); dm_cw(dm_gs, dm_p, 21, as_type<uint>(out.m_59.y)); dm_cw(dm_gs, dm_p, 22, as_type<uint>(out.m_59.z)); dm_cw(dm_gs, dm_p, 23, as_type<uint>(out.m_59.w)); dm_cw(dm_gs, dm_p, 24, as_type<uint>(out.m_63.x)); dm_cw(dm_gs, dm_p, 25, as_type<uint>(out.m_63.y)); dm_cw(dm_gs, dm_p, 26, as_type<uint>(out.m_63.z)); dm_cw(dm_gs, dm_p, 27, as_type<uint>(out.m_63.w)); dm_cw(dm_gs, dm_p, 28, as_type<uint>(out.m_47.x)); dm_cw(dm_gs, dm_p, 29, as_type<uint>(out.m_47.y)); dm_cw(dm_gs, dm_p, 30, as_type<uint>(out.m_47.z)); dm_cw(dm_gs, dm_p, 31, as_type<uint>(out.m_47.w)); dm_cw(dm_gs, dm_p, 32, as_type<uint>(out.m_55.x)); dm_cw(dm_gs, dm_p, 33, as_type<uint>(out.m_55.y)); dm_cw(dm_gs, dm_p, 34, as_type<uint>(out.m_55.z)); dm_cw(dm_gs, dm_p, 35, as_type<uint>(out.m_55.w)); dm_cw(dm_gs, dm_p, 36, 0u); dm_cw(dm_gs, dm_p, 37, 0u); dm_cw(dm_gs, dm_p, 38, 0u); dm_cw(dm_gs, dm_p, 39, 0x3f800000u); dm_cw(dm_gs, dm_p, 40, as_type<uint>(out.m_65.x)); dm_cw(dm_gs, dm_p, 41, as_type<uint>(out.m_65.y)); dm_cw(dm_gs, dm_p, 42, as_type<uint>(out.m_65.z)); dm_cw(dm_gs, dm_p, 43, as_type<uint>(out.m_65.w)); dm_cw(dm_gs, dm_p, 44, 0u); dm_cw(dm_gs, dm_p, 45, 0u); dm_cw(dm_gs, dm_p, 46, 0u); dm_cw(dm_gs, dm_p, 47, 0x3f800000u); dm_cw(dm_gs, dm_p, 48, 0u); dm_cw(dm_gs, dm_p, 49, 0u); dm_cw(dm_gs, dm_p, 50, 0u); dm_cw(dm_gs, dm_p, 51, 0x3f800000u); dm_cw(dm_gs, dm_p, 52, 0u); dm_cw(dm_gs, dm_p, 53, 0u); dm_cw(dm_gs, dm_p, 54, 0u); dm_cw(dm_gs, dm_p, 55, 0x3f800000u); dm_cw(dm_gs, dm_p, 56, 0u); dm_cw(dm_gs, dm_p, 57, 0u); dm_cw(dm_gs, dm_p, 58, 0u); dm_cw(dm_gs, dm_p, 59, 0x3f800000u); dm_cw(dm_gs, dm_p, 60, 0u); dm_cw(dm_gs, dm_p, 61, 0u); dm_cw(dm_gs, dm_p, 62, 0u); dm_cw(dm_gs, dm_p, 63, 0x3f800000u); dm_cw(dm_gs, dm_p, 64, 0u); dm_cw(dm_gs, dm_p, 65, 0u); dm_cw(dm_gs, dm_p, 66, 0u); dm_cw(dm_gs, dm_p, 67, 0x3f800000u); dm_cw(dm_gs, dm_p, 68, 0u); dm_cw(dm_gs, dm_p, 69, 0u); dm_cw(dm_gs, dm_p, 70, 0u); dm_cw(dm_gs, dm_p, 71, 0x3f800000u); dm_cw(dm_gs, dm_p, 72, 0u); dm_cw(dm_gs, dm_p, 73, 0u); dm_cw(dm_gs, dm_p, 74, 0u); dm_cw(dm_gs, dm_p, 75, 0x3f800000u); dm_cw(dm_gs, dm_p, 76, 0u); dm_cw(dm_gs, dm_p, 77, 0u); dm_cw(dm_gs, dm_p, 78, 0u); dm_cw(dm_gs, dm_p, 79, 0x3f800000u); dm_cw(dm_gs, dm_p, 80, 0u); dm_cw(dm_gs, dm_p, 81, 0u); dm_cw(dm_gs, dm_p, 82, 0u); dm_cw(dm_gs, dm_p, 83, 0x3f800000u); dm_cw(dm_gs, dm_p, 84, 0u); dm_cw(dm_gs, dm_p, 85, 0u); dm_cw(dm_gs, dm_p, 86, 0u); dm_cw(dm_gs, dm_p, 87, 0x3f800000u); dm_cw(dm_gs, dm_p, 88, 0u); dm_cw(dm_gs, dm_p, 89, 0u); dm_cw(dm_gs, dm_p, 90, 0u); dm_cw(dm_gs, dm_p, 91, 0x3f800000u); dm_cw(dm_gs, dm_p, 92, 0u); dm_cw(dm_gs, dm_p, 93, 0u); dm_cw(dm_gs, dm_p, 94, 0u); dm_cw(dm_gs, dm_p, 95, 0x3f800000u); dm_cw(dm_gs, dm_p, 96, 0u); dm_cw(dm_gs, dm_p, 97, 0u); dm_cw(dm_gs, dm_p, 98, 0u); dm_cw(dm_gs, dm_p, 99, 0x3f800000u); dm_cw(dm_gs, dm_p, 100, 0u); dm_cw(dm_gs, dm_p, 101, 0u); dm_cw(dm_gs, dm_p, 102, 0u); dm_cw(dm_gs, dm_p, 103, 0x3f800000u); dm_cw(dm_gs, dm_p, 104, 0u); dm_cw(dm_gs, dm_p, 105, 0u); dm_cw(dm_gs, dm_p, 106, 0u); dm_cw(dm_gs, dm_p, 107, 0x3f800000u); dm_cw(dm_gs, dm_p, 108, 0u); dm_cw(dm_gs, dm_p, 109, 0u); dm_cw(dm_gs, dm_p, 110, 0u); dm_cw(dm_gs, dm_p, 111, 0x3f800000u); dm_cw(dm_gs, dm_p, 112, 0u); dm_cw(dm_gs, dm_p, 113, 0u); dm_cw(dm_gs, dm_p, 114, 0u); dm_cw(dm_gs, dm_p, 115, 0x3f800000u); dm_cw(dm_gs, dm_p, 116, 0u); dm_cw(dm_gs, dm_p, 117, 0u); dm_cw(dm_gs, dm_p, 118, 0u); dm_cw(dm_gs, dm_p, 119, 0x3f800000u); dm_cw(dm_gs, dm_p, 120, 0u); dm_cw(dm_gs, dm_p, 121, 0u); dm_cw(dm_gs, dm_p, 122, 0u); dm_cw(dm_gs, dm_p, 123, 0x3f800000u); dm_cw(dm_gs, dm_p, 124, 0u); dm_cw(dm_gs, dm_p, 125, 0u); dm_cw(dm_gs, dm_p, 126, 0u); dm_cw(dm_gs, dm_p, 127, 0x3f800000u); dm_cw(dm_gs, dm_p, 128, 0u); dm_cw(dm_gs, dm_p, 129, 0u); dm_cw(dm_gs, dm_p, 130, 0u); dm_cw(dm_gs, dm_p, 131, 0x3f800000u); dm_cw(dm_gs, dm_p, 132, 0u); dm_cw(dm_gs, dm_p, 133, 0u); dm_cw(dm_gs, dm_p, 134, 0u); dm_cw(dm_gs, dm_p, 135, 0x3f800000u); dm_cw(dm_gs, dm_p, 136, 0u); dm_cw(dm_gs, dm_p, 137, 0u); dm_cw(dm_gs, dm_p, 138, 0u); dm_cw(dm_gs, dm_p, 139, 0x3f800000u); dm_cw(dm_gs, dm_p, 140, 0u); dm_cw(dm_gs, dm_p, 141, 0u); dm_cw(dm_gs, dm_p, 142, 0u); dm_cw(dm_gs, dm_p, 143, 0x3f800000u); return; }
}

